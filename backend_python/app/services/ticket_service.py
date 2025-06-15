from app.models.Ticket import Ticket
from app.models.User import User
from app.models.Seat import Seat
from app import db
from app.utils.helper import format_date, format_datetime, format_time
from .totalDayly_service import create_or_update_total_day
from datetime import datetime
from .broadcast_service import get_broadcast_by_id
from sqlalchemy import and_
from .seat_service import get_seat_available, set_seat_bought


def create_ticket(user_id, broadcast_id, seat_id):
    try:
        broadcast = get_broadcast_by_id(broadcast_id)
        if not broadcast:
            raise ValueError("Broadcast not found")
        if not get_seat_available(seat_id):
            raise ValueError("Seat not available")
        price = broadcast.price
        ticket = Ticket(
            broadcast_id=broadcast_id,
            seat_id=seat_id,
            date_order=datetime.now(),
            user_id=user_id,
            price=price
        )
        db.session.add(ticket)
        db.session.commit()
        # Set the seat as bought
        set_seat_bought(seat_id)
        create_or_update_total_day(price, ticket.dateOrder.day, ticket.dateOrder.month, ticket.dateOrder.year)
        return ticket
    except Exception as e:
        db.session.rollback()
        raise ValueError(f"Error creating ticket: {str(e)}")

def get_ticket_by_id(ticket_id):
    """Retrieve a ticket by its ID."""
    ticket = Ticket.query.filter_by(ID=ticket_id, is_delete=False).first()
    if not ticket:
        raise ValueError("Ticket not found")
    return ticket



def get_all_tickets():
    """Retrieve all tickets."""
    tickets = Ticket.query.filter_by(is_delete=False).all()
    return tickets



def get_tickets_by_user(user_id):
    """Retrieve all tickets for a specific user."""
    user = User.query.filter_by(ID=user_id, is_delete=False).first()
    if not user:
        raise ValueError("User not found")

    tickets = Ticket.query.filter_by(userID=user_id, is_delete=False).all()
    return tickets




def delete_ticket(ticket_id):
    """Soft delete a ticket by setting is_delete to True."""
    ticket = Ticket.query.filter_by(ID=ticket_id, is_delete=False).first()
    if not ticket:
        return {"message": "Ticket not found"}, 404
    
    ticket.is_delete = True
    db.session.commit()
    create_or_update_total_day(-ticket.price, ticket.dateOrder, ticket.dateOrder.month, ticket.dateOrder.year)
    return {"message": "Ticket deleted successfully"}, 200