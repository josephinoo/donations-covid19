import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../pages/SeletionCentre.dart';

class Inicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Inicio"),
          flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[Color(0xFF17ead9), Color(0xFF00d4ff)]))),
        ),
        backgroundColor: Color(0xFFFFFFFF),
        body: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 60,
              ),
              Container(
                padding: EdgeInsets.symmetric(),
                margin: EdgeInsets.all(0),
                child: Text(
                  'DONACIONES-COVID19',
                  style: TextStyle(
                    fontFamily: 'Poppins-Bold',
                    fontSize: ScreenUtil.getInstance().setSp(50),
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Image.asset(
                'assets/inicio_donate.png',
                width: 400,
                height: 400,
              ),
              Container(
                  margin: EdgeInsets.all(0),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.all(10),
                              child: Image.asset(
                                'assets/dono.png',
                                width: 50,
                                height: 50,
                              )),
                          Text(
                            'Donar',
                            style: TextStyle(fontSize: 40.0),
                          )
                        ]),
                    color: Color(0xFF00d4ff), //0xFF6078ea
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SelectionCentre()));
                    },
                  )),
              Container()
            ],
          ),
        ));
  }
}
