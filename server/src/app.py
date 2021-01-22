from flask import Flask,request,jsonify 
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
        id=mongo.db.users.insert({
            'username':username,
            'password':password,
            'email':email
        })
        responde={
            'id':str(id),
            'username':username,
            'password':password,
            'email':email
        }
        return response
    else:
        return not_found()
    return  {'message':'recived'}
    
@app.errorhandler(404)
def not_found(error=None):
    response=jsonify({
        'message':'Resource Not Found'+request.url,
        'status':404
    })
    response.status_code=404
    return response

if __name__=="__main__":
    app.run(debug=True)
