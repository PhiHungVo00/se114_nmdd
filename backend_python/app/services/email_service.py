import os
import smtplib
from email.message import EmailMessage

EMAIL_HOST = os.getenv('EMAIL_HOST', 'localhost')
EMAIL_PORT = int(os.getenv('EMAIL_PORT', 25))
EMAIL_USER = os.getenv('EMAIL_USER')
EMAIL_PASS = os.getenv('EMAIL_PASS')


def send_email(to_address, subject, body):
    message = EmailMessage()
    message['Subject'] = subject
    message['From'] = EMAIL_USER if EMAIL_USER else 'no-reply@example.com'
    message['To'] = to_address
    message.set_content(body)

    try:
        with smtplib.SMTP(EMAIL_HOST, EMAIL_PORT) as server:
            if EMAIL_USER and EMAIL_PASS:
                server.starttls()
                server.login(EMAIL_USER, EMAIL_PASS)
            server.send_message(message)
    except Exception as e:
        print(f'Error sending email: {e}')


def send_ticket_email(to_address, ticket_detail):
    subject = f"Ticket Confirmation #{ticket_detail['ID']}"
    body = (
        f"Thank you for your purchase.\n"
        f"Ticket ID: {ticket_detail['ID']}\n"
        f"Movie: {ticket_detail['Broadcast']['FirmName']}\n"
        f"Date: {ticket_detail['Broadcast']['DateBroadcast']}\n"
        f"Time: {ticket_detail['Broadcast']['TimeBroadcast']}\n"
        f"Seat: {ticket_detail['SeatID']}\n"
        f"Room: {ticket_detail['RoomID']}\n"
        f"Price: {ticket_detail['Price']}"
    )
    send_email(to_address, subject, body)
