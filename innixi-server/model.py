from app import db
from datetime import datetime, timedelta
from enum import Enum

db.metadata.clear()
class CheckIn(db.Model):
    __tablename__ = 'checkins'
    id = db.Column(db.Integer, primary_key = True, autoincrement = True)
    user = db.Column(db.String(120), nullable=False)
    feelings = db.relationship('CheckInFeeling', backref='checkins', lazy=True)
    updatedAt = db.Column(db.DateTime, nullable=False, default=datetime.utcnow)

    def __repr__(self):
        return '<Checkin Id: {0}, User: {1}>'.format(self.id, self.user)



class CheckInFeeling(db.Model):
    __tablename__ = 'checkin_feelings'
    id = db.Column(db.Integer, primary_key = True, autoincrement = True)
    checkInId = db.Column(db.Integer, db.ForeignKey('checkins.id'), nullable = False)
    feeling = db.Column(db.String(120), nullable=False)
    level = db.Column(db.Integer, nullable = False, default = 0)
    activities = db.relationship('CheckInFeelingActivity', backref='checkin_feelings', lazy=True)

    def __repr__(self):
        return '<CheckInFeeling Id: {0}, Feeling: {1}>'.format(self.id, self.feeling)


class CheckInFeelingActivity(db.Model):
    __tablename__ = 'checkin_feeling_activities'
    id = db.Column(db.Integer, primary_key=True, autoincrement = True)
    checkInFeelingId = db.Column(db.Integer, db.ForeignKey('checkin_feelings.id'), nullable = False)
    activity = db.Column(db.String(120), nullable=False)

    def __repr__(self):
        return '<CheckInFeelingActivity Id: {0}, Activity: {1}>'.format(self.id, self.activity)


class ExerciseLog(db.Model):
    __tablename__ = 'exercise_log'
    id = db.Column(db.Integer, primary_key=True, autoincrement = True)
    name = db.Column(db.String(120), nullable=False)
    start = db.Column(db.DateTime, nullable=False, default=datetime.utcnow)
    end = db.Column(db.DateTime, nullable=False, default=datetime.utcnow)

    def __repr__(self):
        return '<ExerciseLog Id: {0}, Exercise: {1}>'.format(self.id, self.name)


class SleepLog(db.Model):
    __tablename__ = 'sleep_log'
    id = db.Column(db.Integer, primary_key=True, autoincrement = True)
    name = db.Column(db.String(120), nullable=False)
    start = db.Column(db.DateTime, nullable=False, default=datetime.utcnow)
    end = db.Column(db.DateTime, nullable=False, default=datetime.utcnow)

    def __repr__(self):
        return '<SleepLog Id: {0}, User: {3}, Start: {1}, End: {2}>'.format(self.id, self.start, self.end, self.user)

class ConcernType(Enum):
    GENERIC = 1
    PANDEMIC = 2

class Onboarding(db.Model):
    __tablename__ = 'onboarding'
    id = db.Column(db.Integer, primary_key=True, autoincrement = True)
    user = db.Column(db.String(120), nullable=False)
    concern = db.Column(db.String(120), nullable=False, default = ConcernType.GENERIC)
    type = db.Column(db.Enum(ConcernType), nullable=False)

    def __repr__(self):
        return '<Onboarding Id: {0}, User: {1}, Concern: {2}>'.format(self.id, self.user, self.concern)

class Goal(db.Model):
    __tablename__ = 'user_goals'
    id = db.Column(db.Integer, primary_key=True, autoincrement = True)
    user = db.Column(db.String(120), nullable=False)
    weeklyCheckin = db.Column(db.Integer, nullable = False, default = 7)
    dailySleepHours = db.Column(db.Integer, nullable = False, default = 8)
    dailyExerciseHours = db.Column(db.Integer, nullable = False, default = 2)

    def __repr__(self):
        return '<Goal Id: {0}, User: {1}, weeklyCheckin: {2}, dailySleepHours: {3}, dailyExerciseHours: {4}>'.format(self.id, self.user, self.weeklyCheckin, self.dailySleepHours,self.dailyExerciseHours)


class Authentication(db.Model):
    __tablename__ = 'authentication'
    id = db.Column(db.Integer, primary_key=True, autoincrement = True)
    user = db.Column(db.String(120), nullable=False, unique = True)
    token = db.Column(db.String(255), nullable=False)
    expiry = db.Column(db.DateTime, nullable=False, default=datetime(2021, 12, 31))

    def __repr__(self):
        return '<Authentication Id: {0}, User: {1}'.format(self.id, self.user)

class Notifications(db.Model):
    __tablename__ = 'notifications'
    id = db.Column(db.Integer, primary_key=True, autoincrement = True)
    user = db.Column(db.String(120), nullable=False)
    end = db.Column(db.DateTime, nullable=False, default=datetime.utcnow)
    shown = db.Column(db.Boolean, unique=False, default=True)
    text = db.Column(db.String(120), nullable=False)

    def __repr__(self):
        return '<Notification Id: {0}, User: {1}'.format(self.id, self.user)

def registerUser(user):
    return token

def authenticate(user, token):
    return True

def weeklyCheckinCount(user):
    return getWeekCheckins(user).count()

def getWeekCheckins(user):
    now = datetime.now()
    week_start = now - timedelta(days=datetime.weekday(now)+1, hours = now.hour, minutes = now.minute, seconds = now.second, microseconds = now.microsecond)
    res = db.session.query(CheckIn).filter(CheckIn.updatedAt > week_start, CheckIn.user == user)
    return res

# db.drop_all()
db.create_all()
print('Created Tables')
