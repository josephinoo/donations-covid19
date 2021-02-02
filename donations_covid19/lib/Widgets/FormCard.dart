import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormCard extends StatefulWidget {
  @override
  _FormCard createState() => _FormCard();
}

class _FormCard extends State<FormCard> {
  var username = TextEditingController();
  var password = TextEditingController();

  @override
  void dispose() {
    username.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: ScreenUtil.getInstance().setHeight(500),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0.0, 15.0),
              blurRadius: 15.0,
            ),
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0.0, -10.0),
              blurRadius: 10.0,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Login',
                  style: TextStyle(
                    fontSize: ScreenUtil.getInstance().setSp(45),
                    fontFamily: 'Poppins-Bold',
                    letterSpacing: .6,
                  )),
              SizedBox(
                height: ScreenUtil.getInstance().setHeight(30),
              ),
              Text('Usuario',
                  style: TextStyle(
                    fontFamily: 'Poppins-Medium',
                    fontSize: ScreenUtil.getInstance().setSp(26),
                  )),
              TextField(
                decoration: InputDecoration(
                    hintText: 'username',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
                controller: username,
              ),
              SizedBox(
                height: ScreenUtil.getInstance().setHeight(30),
              ),
              Text('Contraseña',
                  style: TextStyle(
                    fontFamily: 'Poppins-Medium',
                    fontSize: ScreenUtil.getInstance().setSp(26),
                  )),
              TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: 'contraseña',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
                  controller: password),
              SizedBox(
                height: ScreenUtil.getInstance().setHeight(35),
              ),
            ],
          ),
        ));
  }
}

class GlobalState {
  final Map<dynamic, dynamic> _data = <dynamic, dynamic>{};

  static GlobalState instance = GlobalState._();
  GlobalState._();

  set(dynamic key, dynamic value) => _data[key] = value;
  get(dynamic key) => _data[key];
}

final GlobalState store = GlobalState.instance;
