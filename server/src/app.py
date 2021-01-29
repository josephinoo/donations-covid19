from flask import Flask,request,jsonify,Response
from flask_pymongo import PyMongo
import datetime
import json
from bson import  json_util
app=Flask(__name__)
app.config["MONGO_URI"]='mongodb://localhost/donations'
mongo=PyMongo(app)

@app.route("/login",methods=['POST'])
def login():
    users=mongo.db.users
    login_user=user.find_one({'name': request.form['username']})
    password=login_user['password'].encode('utf8')
    if login_user:
        if(password==request.form['password']):
            return 'ok'
        else:
            return "Invalid username/password conbination"



    return ''
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
        response={
            'id':str(id),
            'username':username,
            'password':password,
            'email':email
        }
        print(response)
        return response
    else:
        return not_found()
    return  {'message':'recived'}

@app.route('/user/<id>',methods=['PUT'])
def update_user(id):
    username=request.json['username']
    password=request.json['password']
    email=request.json['email']
    if  username and email and password:
        mongo.db.users.update_one({'_id': id  },{'$set':{
            'username':username,
            'password':password,
            'email':email
        }})
        response = jsonify({"menssage":'User '+id+' was updated successfully'})
        return response
    else:
        response = jsonify({"menssage":'User '+id+' does not exist'})
        return response

@app.route('/donations',methods=['POST'])
def donate():
    username=request.json['username']
    amount=request.json['amount']
    date=str(datetime.datetime.now())
    if(username  and amount):
        id=mongo.db.donations.insert({
            'username':username,
            'amount':amount,
            'date':date
        })
        response={
            'message':'Donation saved'
        }
        return response
    else:
        return {'message': 'Error'}
@app.route('/donations',methods=['GET'])
def get_donations():
    donations=mongo.db.donations.find()
    response=json_util.dumps(donations)
    return Response(response,mimetype='application/json')


@app.route('/users/<id>',methods=['DELETE'])
def delete_user(id):
    mongo.db.users.delete_one({'id':id})
    response =jsonify({'message': 'User' + id + 'was Delate successfully'})
    return response


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
