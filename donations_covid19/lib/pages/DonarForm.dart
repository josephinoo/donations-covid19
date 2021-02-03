import 'package:flutter/material.dart';
import 'Inicio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json;
//import 'package:validators/validators.dart' as validator;
//import 'model.dart';
//import 'result.dart';

class DonarForm extends StatelessWidget {
  String centroSalud;

  DonarForm(this.centroSalud);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Confirmar Donación"),
        flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[Color(0xFF17ead9), Color(0xFF00d4ff)]))),
      ),
      backgroundColor: Color(0xFFFFFFFF),
      body: Stack(fit: StackFit.expand, children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Image.asset('assets/thanks.png')),
            Expanded(
              child: Container(),
            ),
            Image.asset('assets/image_02.png'),
          ],
        ),
        TestForm(centroSalud)
      ]),
    );
  }
}

class TestForm extends StatefulWidget {
  String centroSalud;

  TestForm(this.centroSalud);
  @override
  _TestFormState createState() => _TestFormState(this.centroSalud);
}

class _TestFormState extends State<TestForm> {
  String centroSalud;

  _TestFormState(this.centroSalud);

  final _formKey = GlobalKey<FormState>();

  //Model model = Model();

  @override
  Widget build(BuildContext context) {
    //final halfMediaWidth = MediaQuery.of(context).size.width / 2.0;
    int _value = 5;
    var cardnumber;
    var cardholder;
    var cardcvv;
    var cardexpdate;
    var amount;
    var username = "josdavil";

    return Center(
        child: Container(
            margin: EdgeInsets.only(left: 30, top: 100, right: 30, bottom: 50),
            height: 300, //double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  MyTextFormField(
                    hintText: 'Número de tarjeta de crédito',
                    //isEmail: true,
                    validator: (String value) {
                      /*if (!validator.isEmail(value)) {
                return 'Please enter a valid email';
              }*/
                      return null;
                    },
                    onSaved: (String value) {
                      //model.email = value;
                      cardnumber = value;
                    },
                  ),
                  Container(
                      child: Row(
                    children: <Widget>[
                      Expanded(
                          flex: 2,
                          child: MyTextFormField(
                            hintText: 'F.exp.',

                            //isEmail: true,
                            validator: (String value) {
                              /*if (!validator.isEmail(value)) {
                    return 'Please enter a valid email';
                  }*/
                              return null;
                            },
                            onSaved: (String value) {
                              cardexpdate = value;
                              //model.email = value;
                            },
                          )),
                      Expanded(
                          flex: 2,
                          child: MyTextFormField(
                            hintText: 'CVV',
                            //isEmail: true,
                            validator: (String value) {
                              /*if (!validator.isEmail(value)) {
                    return 'Please enter a valid email';
                  }*/
                              return null;
                            },
                            onSaved: (String value) {
                              cardcvv = value;
                              //model.email = value;
                            },
                          )),
                    ],
                  )),
                  MyTextFormField(
                    hintText: 'Titular de tarjeta',
                    //isEmail: true,
                    validator: (String value) {
                      /*if (!validator.isEmail(value)) {
                return 'Please enter a valid email';
              }*/
                      return null;
                    },
                    onSaved: (String value) {
                      cardholder = value;
                      //model.email = value;
                    },
                  ),
                  Container(
                      child: Row(
                    children: <Widget>[
                      Expanded(
                          flex: 2,
                          child: Text(
                            'Cantidad a donar',
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            //style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                      Expanded(
                        flex: 2,
                        child: DropdownButton(
                            value: _value,
                            items: [
                              DropdownMenuItem(
                                child: Text("5 dólares"),
                                value: 5,
                              ),
                              DropdownMenuItem(
                                child: Text("10 dólares"),
                                value: 10,
                              ),
                              DropdownMenuItem(
                                  child: Text("25 dólares"), value: 25),
                              DropdownMenuItem(
                                  child: Text("50 dólares"), value: 50)
                            ],
                            onChanged: (value) {
                              setState(() {
                                _value = value;
                              });
                            }),
                      ),
                    ],
                  )),
                  RaisedButton(
                    color: Color(0xFF00d4ff),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        final url = "http://127.0.0.1:5000/donations";

                        print(_value);
                        final response = await http.post(url,
                            body: json.encode({
                              'username': username,
                              'amount': _value,
                              'cardnumber': cardnumber,
                              'cardexpdate': cardexpdate,
                              'cardcvv': cardcvv,
                              'cardholder': cardholder,
                              'centroSalud': centroSalud
                            }));
                        print(centroSalud);
                        print(response.body);
                        if (response.body == "ok") {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Inicio()));
                        }
                      }
                    },
                    child: Text(
                      'Donar',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            )));
  }
}

class MyTextFormField extends StatelessWidget {
  final String hintText;
  final Function validator;
  final Function onSaved;
  final bool isPassword;
  final bool isEmail;

  MyTextFormField({
    this.hintText,
    this.validator,
    this.onSaved,
    this.isPassword = false,
    this.isEmail = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.all(15.0),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey[200],
        ),
        obscureText: isPassword ? true : false,
        validator: validator,
        onSaved: onSaved,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      ),
    );
  }
}
