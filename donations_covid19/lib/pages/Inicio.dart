import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Inicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Inicio"),
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
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    'DONAR',
                    style: TextStyle(fontSize: 50.0),
                  ),
                  color: Colors.blueAccent,
                  textColor: Colors.white,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ));
  }
}
