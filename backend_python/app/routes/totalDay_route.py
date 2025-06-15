from app.services.totalDayly_service import (
    refresh_total_day
)

from flask import Blueprint, jsonify, request
from flask_jwt_extended import jwt_required, get_jwt_identity


TOTAL_DAY_BLUEPRINT = Blueprint('total_day', __name__)


# Refresh total day data
# link: localhost:5000/api/total_day/refresh?day=1&month=1&year=2023
@TOTAL_DAY_BLUEPRINT.route('/refresh', methods=['POST'])
@jwt_required()
def refresh_total_day_route():
    """Refresh total day data."""
    user_id = get_jwt_identity()
    day = request.args.get('day', None)
    month = request.args.get('month', None)
    year = request.args.get('year', None)
    if not day or not month or not year:
        return jsonify({'message': 'Day, month, and year are required'}), 400
    try:
        result = refresh_total_day(day, month, year)
        return jsonify(result), 200
    except ValueError as e:
        return jsonify({'message': str(e)}), 400
    except Exception as e:
        return jsonify({'message': 'An error occurred while refreshing total day data.'}), 500