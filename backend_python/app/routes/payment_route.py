from flask import Blueprint, jsonify, request
from flask_jwt_extended import jwt_required
from app.services.payment_service import simulate_payment

PAYMENT_BLUEPRINT = Blueprint('payment', __name__)

@PAYMENT_BLUEPRINT.route('/paypal', methods=['POST'])
@jwt_required()
def paypal_payment():
    data = request.get_json()
    amount = data.get('amount')
    currency = data.get('currency', 'USD')
    if amount is None:
        return jsonify({'message': 'Amount required'}), 400
    result = simulate_payment('paypal', amount, currency)
    return jsonify(result), 200

@PAYMENT_BLUEPRINT.route('/stripe', methods=['POST'])
@jwt_required()
def stripe_payment():
    data = request.get_json()
    amount = data.get('amount')
    currency = data.get('currency', 'USD')
    if amount is None:
        return jsonify({'message': 'Amount required'}), 400
    result = simulate_payment('stripe', amount, currency)
    return jsonify(result), 200
