
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
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> CartPage()));
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
                  style: TextStyle(fontSize: 7, color: Colors.white),
                ),
              ),
            )),
      ],
    ),
  );
}