from flask import Flask, render_template, request, jsonify
import model as m
from flask_sqlalchemy import SQLAlchemy
import random

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+mysqlconnector://admin:innixi123@innixi.cqd8wcdxdx8y.us-east-2.rds.amazonaws.com/innixi'
app.config['SQLALCHEMY_ECHO'] = True
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = True
db = SQLAlchemy(app=app)



@app.route("/health")
def health():
    return "Health O.K!"

@app.route("/register")
def registerUserAndGetToken():
    query_user = request.args.get('user')
    return jsonify(registerUserAndGetToken(query_user))

@app.route("/getWeekCheckinsForUser")
def getWeekCheckinsForUser():
    query_user = request.args.get('user')
    return jsonify(m.getWeekCheckins(query_user).all())

@app.route("/insertCheckin", methods=["POST"])
def insertCheckIn():
    # checkin = m.CheckIn(user = 'test2')
    # feeling1 = m.CheckInFeeling(feeling = 'Angry', level = 0)
    # feeling1.activities.append(m.CheckInFeelingActivity(activity='Work'))
    # feeling1.activities.append(m.CheckInFeelingActivity(activity='Family'))
    # checkin.feelings.append(feeling1)
    # db.session.add(checkin)
    # db.session.commit()

    checkin = m.CheckIn(user = 'test2')
    feeling1 = m.CheckInFeeling(feeling = 'Happy', level = 3)
    feeling1.activities.append(m.CheckInFeelingActivity(activity='Friends'))
    feeling1.activities.append(m.CheckInFeelingActivity(activity='Family'))
    checkin.feelings.append(feeling1)
    db.session.add(checkin)
    db.session.commit()
    return jsonify("Success")


@app.route("/getWeeklyCheckInCount", methods=["GET"])
def getCheckInCount():
    query_user = request.args.get('user')
    return jsonify(m.weeklyCheckinCount(user = query_user))

@app.route("/getWeeklyAverageSleep", methods=["GET"])
def getWeeklyAverageSleep():
    return jsonify(random.randint(4, 12))

@app.route("/getWeeklyAverageExercise", methods=["GET"])
def getWeeklyAverageExercise():
    return jsonify(random.randint(4, 12))

@app.route("/getDailyAverageSleepForWeek", methods=["GET"])
def getDailyAverageSleepForWeek():
    list = [8, 9, 5, 7, 10, 8, 8]
    random.shuffle(list)
    return jsonify(list)

@app.route("/getWeeklyAverageFeelings", methods=["GET"])
def getWeeklyAverageFeelings():
    query_user = request.args.get('user')
    return jsonify(getAverageFeelingsForTop3(user= query_user))

@app.route("/getMostFreqActivityForFeeling", methods=["GET"])
def getMostFreqActivityForFeeling():
    user = request.args.get('user')
    feeling = request.args.get('feeling')
    return jsonify(getMostFreqActivityTop3(user, feeling))

@app.route("/deleteAllData", methods=["GET"])
def deleteAllData():
    user = request.args.get('user')
    return jsonify(True)

def getMostFreqActivityTop3(user, feeling):
    activityMap = {}
    checkins = m.getWeekCheckins(user = user)
    total = 0
    for c in checkins:
        for checkinFeeling in c.feelings:
            if checkinFeeling.feeling == feeling:
                for activity in checkinFeeling.activities:
                    total = total + 1
                    if activity.activity not in activityMap:
                        activityMap[activity.activity] = 0
                    activityMap[activity.activity] = activityMap[activity.activity] + checkinFeeling.level
    max = 3.0 * total
    for k, v in activityMap.items():
        activityMap[k] = activityMap[k] / max
    top3 = {k: v for k, v in sorted(activityMap.items(), key=lambda item: item[1], reverse = True)[:3]}
    return top3


def getAverageFeelingsForTop3(user):
    feelingMap = {}
    checkins = m.getWeekCheckins(user = user)
    total = 0
    for c in checkins:
        for checkinFeeling in c.feelings:
            total = total + 1
            if checkinFeeling.feeling not in feelingMap:
                feelingMap[checkinFeeling.feeling] = 0
            feelingMap[checkinFeeling.feeling] = feelingMap[checkinFeeling.feeling] + checkinFeeling.level
    max = 3.0 * total
    for k, v in feelingMap.items():
        feelingMap[k] = feelingMap[k] / max
    top3 = {k: v for k, v in sorted(feelingMap.items(), key=lambda item: item[1], reverse = True)[:3]}
    return top3


if __name__ == '__main__':
    app.run(debug=True)
