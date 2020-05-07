import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

searchBar(BuildContext context, TextEditingController data) {
  var screenSize = MediaQuery.of(context).size;
  return Container(
    width: screenSize.width * 0.4,
    height: 40,
    padding: EdgeInsets.symmetric(vertical: 2),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8))),
    child: TextField(
      controller: data,
      cursorColor: Colors.grey,
      style: TextStyle(fontSize: 13, fontFamily: "F"),
      decoration: InputDecoration(
        border: InputBorder.none,
        prefixIcon: Icon(
          Icons.search,
          color: Colors.grey,
        ),
        hintText: "Search...",
        hintStyle: TextStyle(fontSize: 14),
      ),
    ),
  );
}

logoImage(BuildContext context) {
  return Container(
    width: 80,
    height: 80,
    child: Image(
      image: AssetImage("assets/images/logo.png"),
    ),
  );
}

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
              print("keranjang");
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
