import uuid
from datetime import datetime

def simulate_payment(provider, amount, currency="USD"):
    """Simulate a payment process and return transaction details."""
    return {
        "provider": provider,
        "amount": amount,
        "currency": currency,
        "transaction_id": str(uuid.uuid4()),
        "status": "success",
        "timestamp": datetime.utcnow().isoformat()
    }
