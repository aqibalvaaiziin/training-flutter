import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:training/screen/cart_page/cart_page.dart';

cartLength(BuildContext context, int data) {
  var screenSize = MediaQuery.of(context).size;
  return Container(
    child: Stack(
      children: <Widget>[
        Container(
          width: screenSize.width * 0.1,
          height: screenSize.width * 0.1,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: FaIcon(
              FontAwesomeIcons.shoppingBag,
              size: 17.5,
            ),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => CartPage()));
            },
          ),
        ),
        Transform.translate(
            offset: Offset(23, 7),
            child: Container(
              width: screenSize.width * 0.03,
              height: screenSize.width * 0.03,
              decoration:
                  BoxDecoration(color: Colors.black, shape: BoxShape.circle),
              child: Center(
                child: Text(
                  data.toString(),
                  style: TextStyle(
                      fontSize: 7,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )),
      ],
    ),
  );
}

cartLengthDetail(BuildContext context, int data) {
  var screenSize = MediaQuery.of(context).size;
  return Container(
    child: Stack(
      children: <Widget>[
        Container(
          width: screenSize.width * 0.12,
          height: screenSize.width * 0.12,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Color(0xffc31ce8),
                Color(0xff8710e3),
                Color(0xff7227e3),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: IconButton(
            icon: FaIcon(
              FontAwesomeIcons.shoppingBag,
              color: Colors.white,
              size: 19,
            ),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => CartPage()));
            },
          ),
        ),
        Transform.translate(
            offset: Offset(27, 9),
            child: Container(
              width: screenSize.width * 0.032,
              height: screenSize.width * 0.032,
              decoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: Center(
                child: Text(
                  data.toString(),
                  style: TextStyle(
                      fontSize: 7,
                      color: Colors.purple,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )),
      ],
    ),
  );
}
