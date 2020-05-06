import 'package:flutter/material.dart';

searchBar(BuildContext context, TextEditingController data) {
  var screenSize = MediaQuery.of(context).size;
  return Container(
    width: screenSize.width * 0.5,
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
