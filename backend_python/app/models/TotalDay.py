from app import db



class TotalDay(db.Model):
    __tablename__ = 'totalday'
    ID = db.Column(db.Integer, primary_key=True)
    totalMoney = db.Column(db.Float)
    date = db.Column(db.Integer)
    month = db.Column(db.Integer)
    year = db.Column(db.Integer)
    

    def __init__(self, total_money, date, month, year):
        self.totalMoney = total_money
        self.date = date
        self.month = month
        self.year = year


    def serialize(self):
        return {
            'ID': self.ID,
            'TotalMoney': self.totalMoney,
            'Date': self.date,
            'Month': self.month,
            'Year': self.year
        }