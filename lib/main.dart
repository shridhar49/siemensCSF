import 'package:customersatisfactionform/home_page.dart';
import 'package:customersatisfactionform/questions.dart';
import 'package:customersatisfactionform/review_and_submit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SplashPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashPage extends StatefulWidget {
  @override
  SplashPageState createState() => SplashPageState();
}
class SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                    FirstPagePage()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(750, 1334), allowFontScaling: true);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            color: Colors.white,
            child: Center(
              child: Text("SIEMENS",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: ScreenUtil().setWidth(100),
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
        ),
      ),
    );
  }
}



class FirstPagePage extends StatefulWidget {
  @override
  FirstPagePageState createState() => FirstPagePageState();
}
class FirstPagePageState extends State<FirstPagePage> {
  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(750, 1334), allowFontScaling: true);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("CSF"),
        ),
        body: Container(
          color: Colors.white,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text("Request your feedback based on FAT conducted by GIS works, kindly mark your rating for the individual question",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: ScreenUtil().setWidth(50),
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder:
                    (context) =>
                    MyHomePage()
                )
            );
          },
          child: Icon(Icons.navigate_next),
        ), //
      ),
    );
  }
}

