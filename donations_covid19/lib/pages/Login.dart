import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../pages/Inicio.dart';
import '../Widgets/FormCard.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json;

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  var username = TextEditingController();
  var password = TextEditingController();
  @override
  void dispose() {
    username.dispose();
    password.dispose();
    super.dispose();
  }

  bool _isSelected = false;

  void _radio() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  Widget radioButton(bool isSelected) => Container(
        width: 16.0,
        height: 16.0,
        padding: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 2.0, color: Colors.black),
        ),
        child: isSelected
            ? Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
              )
            : Container(),
      );

  Widget horizontalLine() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          width: ScreenUtil.getInstance().setWidth(120),
          height: 1.0,
          color: Colors.black26.withOpacity(.2),
        ),
      );

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true)
          ..init(context);

    return new Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Image.asset('assets/image_01.png')),
                Expanded(
                  child: Container(),
                ),
                Image.asset('assets/image_02.png'),
              ],
            ),
            SingleChildScrollView(
                child: Padding(
                    padding:
                        EdgeInsets.only(left: 28.0, right: 28.0, top: 60.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Image.asset(
                              'assets/logo.png',
                              width: ScreenUtil.getInstance().setWidth(110),
                              height: ScreenUtil.getInstance().setHeight(110),
                            ),
                            Text('DONACIONES',
                                style: TextStyle(
                                  fontFamily: 'Poppins-Bold',
                                  fontSize: ScreenUtil.getInstance().setSp(40),
                                  letterSpacing: .1,
                                  fontWeight: FontWeight.bold,
                                ))
                          ],
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(180),
                        ),
                        Container(
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
                              padding: EdgeInsets.only(
                                  left: 16.0, top: 16.0, right: 16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('Login',
                                      style: TextStyle(
                                        fontSize:
                                            ScreenUtil.getInstance().setSp(45),
                                        fontFamily: 'Poppins-Bold',
                                        letterSpacing: .6,
                                      )),
                                  SizedBox(
                                    height:
                                        ScreenUtil.getInstance().setHeight(30),
                                  ),
                                  Text('Usuario',
                                      style: TextStyle(
                                        fontFamily: 'Poppins-Medium',
                                        fontSize:
                                            ScreenUtil.getInstance().setSp(26),
                                      )),
                                  TextField(
                                    decoration: InputDecoration(
                                        hintText: 'username',
                                        hintStyle: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12.0)),
                                    controller: username,
                                  ),
                                  SizedBox(
                                    height:
                                        ScreenUtil.getInstance().setHeight(30),
                                  ),
                                  Text('Contraseña',
                                      style: TextStyle(
                                        fontFamily: 'Poppins-Medium',
                                        fontSize:
                                            ScreenUtil.getInstance().setSp(26),
                                      )),
                                  TextField(
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          hintText: 'contraseña',
                                          hintStyle: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12.0)),
                                      controller: password),
                                  SizedBox(
                                    height:
                                        ScreenUtil.getInstance().setHeight(35),
                                  ),
                                ],
                              ),
                            )),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(35),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            InkWell(
                              child: Container(
                                  width: ScreenUtil.getInstance().setWidth(300),
                                  height:
                                      ScreenUtil.getInstance().setHeight(100),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      Color(0xFF17ead9),
                                      Color(0xFF6078ea)
                                    ]),
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                          onTap: () async {
                                            final url =
                                                "http://127.0.0.1:5000/login";

                                            // ignore: unused_local_variable
                                            print(username.text);
                                            final response = await http.post(
                                                url,
                                                body: json.encode({
                                                  'username': username.text,
                                                  'password': password.text
                                                }));
                                            if (response.body == "ok") {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Inicio()));
                                            }
                                          },
                                          child: Center(
                                              child: Text('Entrar',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily:
                                                          'Poppins-Bold',
                                                      fontSize: 18.0,
                                                      letterSpacing: 1.0)))))),
                            )
                          ],
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(40),
                        ),
                        Image.asset('assets/image_02.png'),
                      ],
                    ))),
          ],
        ));
  }
}
