import 'dart:async';
import 'package:flutter/material.dart';
import 'package:training/screen/login/login.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State {
  @override
  void initState() {
    super.initState();
    new Future.delayed(
        const Duration(seconds: 9),
        () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Center(
          child: Image.asset(
            "assets/images/logo.gif",
            width: 240,
            height: 230,
          ),
        ),
      ),
    );
  }
}
