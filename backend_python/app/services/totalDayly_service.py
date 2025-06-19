from app import db
from app.models.TotalDay import TotalDay
from app.models.Ticket import Ticket
from datetime import datetime
from sqlalchemy import extract


def create_or_update_total_day(total_money, day, month, year):
    """
    Create or update a TotalDay record.
    If a record for the given date exists, it updates the totalMoney.
    Otherwise, it creates a new record.
    """
    try:
        # Ensure date is a datetime.date object
        total_day = TotalDay.query.filter_by(date=day, month=month, year=year).first()

        if total_day:
            # Update existing record
            total_day.totalMoney += total_money
        else:
            # Create new record
            total_day = TotalDay(total_money=total_money, date=day, month=month, year=year)
            db.session.add(total_day)
        
        db.session.commit()

    except Exception as e:
        db.session.rollback()
        raise ValueError(f"Error creating or updating TotalDay: {str(e)}")
    


def refresh_total_day(day=None, month=None, year=None):
    """
    Refresh the total day records by summing up the totalMoney for each date.
    This function is useful for recalculating totals if needed.
    """
    try:
        totalDay = TotalDay.query.filter_by(date=day, month=month, year=year).first()
        if not totalDay:
            totalDay = TotalDay(0, date=day, month=month, year=year)
            db.session.add(totalDay)
        totalDay.totalMoney = db.session.query(db.func.sum(Ticket.price)).filter(
            extract('day', Ticket.dateOrder) == day, 
            extract('month', Ticket.dateOrder) == month, 
            extract('year', Ticket.dateOrder) == year,
            Ticket.is_delete == False
        ).scalar() or 0

        db.session.commit()

    except Exception as e:
        db.session.rollback()
        raise ValueError(f"Error refreshing TotalDay: {str(e)}")