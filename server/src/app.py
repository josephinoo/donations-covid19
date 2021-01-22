from flask import Flask,request 
from flask_pymongo import PyMongo
import json 
app=Flask(__name__)
app.config["MONGO_URI"]='mongodb://localhost/donations'
mongo=PyMongo(app)
@app.route('/users',methods=['POST'])
def create_user():
    username=request.json['username']
    password=request.json['password']
    email=request.json['email']
    if username and email and password:
        mongo.db.users.insert({
            'username':username,
            'password':password,
            'email':email
        })
    else:
        return {'message error'}
    return {'message':'recived '}

if __name__=="__main__":
    app.run(debug=True)
