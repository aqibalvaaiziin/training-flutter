import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:training/preferences/preferences.dart';
import 'package:training/providers/providers.dart';
import 'package:training/screen/catalog/catalog.dart';
import 'package:training/screen/login/login_view_model.dart';

class LoginPageView extends LoginPageViewModel {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  PreferencesData _preferencesData = PreferencesData();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              width: screenSize.width,
              height: screenSize.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/bgLogin.jpg"),
                    fit: BoxFit.fitHeight),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: screenSize.width,
                height: screenSize.height * 0.17,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(color: Color(0xffaada6a7), blurRadius: 150)
                ]),
              ),
            ),
            Positioned(
              bottom: 40,
              right: 19,
              left: 19,
              child: inputLogin(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget inputLogin(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width,
      height: screenSize.height * 0.38,
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 15),
          Container(
            width: screenSize.width,
            height: screenSize.height * 0.06,
            margin: EdgeInsets.symmetric(horizontal: 25),
            padding: EdgeInsets.symmetric(vertical: 2),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: TextField(
              controller: email,
              maxLines: 1,
              style: TextStyle(fontFamily: "D", fontWeight: FontWeight.w600),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Email",
                hintStyle: TextStyle(fontSize: 15),
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          Container(
            width: screenSize.width,
            height: screenSize.height * 0.06,
            margin: EdgeInsets.symmetric(horizontal: 25),
            padding: EdgeInsets.symmetric(vertical: 2),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: TextField(
              controller: password,
              obscureText: true,
              maxLines: 1,
              style: TextStyle(fontFamily: "D", fontWeight: FontWeight.w600),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Password",
                hintStyle: TextStyle(fontSize: 15),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          Container(
            width: screenSize.width * 0.65,
            height: screenSize.height * 0.07,
            decoration: BoxDecoration(
              color: Color(0xffed4752),
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: InkWell(
              onTap: () {
                Providers.loginUser(email.text, password.text)
                    .then((value) async {
                  var jsonObject = jsonDecode(jsonEncode(value.data));
                  if (jsonObject['error'] == "Email salah") {
                    Fluttertoast.showToast(
                        msg: "Email atau password salah",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 2,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  } else {
                    _preferencesData.setDataToken(jsonObject['token']);
                    _preferencesData.setDataTokenType(jsonObject['tokenType']);
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => Catalog()),
                        (Route<dynamic> route) => false);
                  }
                });
              },
              child: Center(
                child: Text(
                  "Login",
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: "F",
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          buttonConnect(context),
        ],
      ),
    );
  }

  Widget buttonConnect(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width * 0.6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: screenSize.width * 0.1,
            height: screenSize.width * 0.1,
            decoration:
                BoxDecoration(color: Color(0xffdb4437), shape: BoxShape.circle),
            child: Center(
              child: IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.googlePlusG,
                    color: Colors.white,
                    size: 19,
                  ),
                  onPressed: () {
                    print("google");
                  }),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "Connect with",
            style: TextStyle(
                fontSize: 17, fontFamily: "D", fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            width: screenSize.width * 0.1,
            height: screenSize.width * 0.1,
            decoration:
                BoxDecoration(color: Color(0xff3b5998), shape: BoxShape.circle),
            child: Center(
              child: IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.facebookF,
                    color: Colors.white,
                    size: 19,
                  ),
                  onPressed: () {
                    print("fb");
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
