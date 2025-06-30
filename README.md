# CINESTREAM - App booking cinema ticket

📋 Requirements
Before starting, make sure you have the following installed on your system:

## Java Development Kit (JDK)

Required Version: JDK 17 or JDK 21

Download: Oracle JDK or OpenJDK

## Python

Required Version: Python 3.12 or Python 3.13

Download: Python Downloads

🔍 Verify Installations
Check your installed versions:

```bash
java --version
python --version
```
## 📦 Project Installation & Setup
1️⃣ Clone the Project

```bash
git clone https://github.com/huypro2005/se114_nmdd.git
```



🖥️ Backend Setup (Python)
➡️ Create and Activate Virtual Environment

```bash
python -m venv venv
# Windows
venv\Scripts\activate
# macOS/Linux
source venv/bin/activate
```

➡️ Install Dependencies
```bash
cd backend_python
pip install -r requirements.txt
```

➡️ Configure Environment Variables
Edit the file ./backend_python/.env and update the following values:
```bash
KEY='restfull_api'
DB_HOST={HOST}
DB_PORT={PORT}
DB_USER={USER}
DB_PASSWORD={PASSWORD}
DB_NAME='firmmanagement'
```

📌 Replace {HOST}, {PORT}, {USER}, {PASSWORD} with your actual MySQL connection details.

➡️ Create Database in MySQL
Open your MySQL client and run:
```bash
CREATE DATABASE firmmanagement;
```

Then import data from the provided backup_data.sql file.

➡️ Run Backend Server

```bash
cd backend_python
python run.py
```

✅ If successful, you should see:
```bash
Checking if database tables exist...
Database tables created successfully.
 * Serving Flask app 'app'
 * Debug mode: on
 * Running on http://127.0.0.1:5000
 * Running on http://192.168.1.8:5000
Press CTRL+C to quit
 * Debugger is active!
```

📱 Frontend Setup (Android)
➡️ Open Project
Open the frontend_java folder in Android Studio.

➡️ Configure Backend URL
Edit the file frontend_java/local.properties and add:

```bash
BASE_URL=http://192.168.1.8:5000
```

📌 Make sure to replace 192.168.1.8 with your actual local IP address (same IP where backend is running).

## Account
```bash
- User: 
username: user
password: 123456

- Admin
username: admin
password: admin
```



✅ Notes
Ensure the database is created before running the backend.

This backend uses Flask development server — for production use, consider deploying with a WSGI server like gunicorn or uWSGI.

Frontend is built using Java + Android Studio.


