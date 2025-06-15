from app.services.ticket_service import (
    create_ticket,
    get_ticket_by_id,
    get_all_tickets,
    get_tickets_by_user,
    delete_ticket
)

from flask import Blueprint, request, jsonify
from flask_jwt_extended import jwt_required, get_jwt_identity

TICKET_BLUEPRINT = Blueprint('ticket', __name__)




# Create a new ticket
# # link: localhost:5000/api/tickets/create
'''

{
    "broadcast_id": 1,
    "seat_id": 1
}

'''

@TICKET_BLUEPRINT.route('/create', methods=['POST'])
@jwt_required()
def create_new_ticket():
    """Create a new ticket."""
    data = request.get_json()
    user_id = get_jwt_identity()
    fields = ['broadcast_id', 'seat_id']
    if not all(field in data for field in fields):
        return jsonify({'message': 'Missing required fields'}), 400

    try:
        ticket = create_ticket(
            user_id=user_id,
            broadcast_id=data['broadcast_id'],
            seat_id=data['seat_id']
        )
        return jsonify(ticket.serialize()), 201
    except ValueError as e:
        return jsonify({'message': str(e)}), 400
    

# Get a ticket by ID
# # link: localhost:5000/api/tickets/get/<ticket_id>
@TICKET_BLUEPRINT.route('/get/<int:ticket_id>', methods=['GET'])
def get_ticket(ticket_id):
    """Retrieve a ticket by its ID."""
    return jsonify(get_ticket_by_id(ticket_id)), 200

# Get all tickets
@TICKET_BLUEPRINT.route('/get_all', methods=['GET'])
def get_all_tickets():
    """Retrieve all tickets."""
    return jsonify(get_all_tickets()), 200




# Get tickets by user ID
@TICKET_BLUEPRINT.route('/get_by_user/<int:user_id>', methods=['GET'])
def get_tickets_by_user_route(user_id):
    """Retrieve all tickets for a specific user."""
    return jsonify(get_tickets_by_user(user_id)), 200




# Delete a ticket
@TICKET_BLUEPRINT.route('/delete/<int:ticket_id>', methods=['DELETE'])  
def delete_ticket_route(ticket_id):
    """Soft delete a ticket by setting is_delete to True."""
    result = delete_ticket(ticket_id)
    if 'message' in result:
        return jsonify(result), 404
    return jsonify({'message': 'Ticket deleted successfully'}), 200