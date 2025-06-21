from app.services.totalDayly_service import (
    refresh_total_day,
    get_total_day_by_date,
    get_more_total_days
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
        return jsonify({'message': 'Total day data refreshed successfully.'}), 200
    except ValueError as e:
        return jsonify({'message': str(e)}), 400
    except Exception as e:
        return jsonify({'message': 'An error occurred while refreshing total day data.'}), 500
    


# link: localhost:5000/api/total_day/get/total-day?day=1&month=1&year=2023
@TOTAL_DAY_BLUEPRINT.route('/get/total-day', methods=['GET'])
# @jwt_required()
def get_total_day_route():
    """Get total day data."""
    try:
        data = request.args
        day = int(data.get('day'))
        month = int(data.get('month'))
        year = int(data.get('year'))
        if not day or not month or not year:
            return jsonify({'message': 'Day, month, and year are required'}), 400
        total_day = get_total_day_by_date(day, month, year)
        return jsonify(total_day.serialize()), 200
    except ValueError as e:
        return jsonify({'message': str(e)}), 400
    except Exception as e:
        return jsonify({'message': f'An error occurred while retrieving total day data: {str(e)}'}), 500
    


# Get more total days
# link: localhost:5000/api/total_day/get/more-total-days?start_date=2023-01-01&end_date=2023-01-31
@TOTAL_DAY_BLUEPRINT.route('/get/more-total-days', methods=['GET'])
@jwt_required()
def get_more_total_days_route():
    """Get more total days data."""
    try:
        start_date = request.args.get('start_date')
        end_date = request.args.get('end_date')
        if not start_date or not end_date:
            return jsonify({'message': 'Start date and end date are required'}), 400
        # Assuming the service function is implemented to handle date range
        total_days = get_more_total_days(start_date, end_date)
        return jsonify([day.serialize() for day in total_days]), 200
    except ValueError as e:
        return jsonify({'message': str(e)}), 400
    except Exception as e:
        return jsonify({'message': f'An error occurred while retrieving more total days: {str(e)}'}), 500
