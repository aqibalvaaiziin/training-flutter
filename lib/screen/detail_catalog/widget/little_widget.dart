import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:training/screen/catalog/catalog.dart';

buttonBack(BuildContext context) {
  var screenSize = MediaQuery.of(context).size;
  return Container(
    width: screenSize.width * 0.12,
    height: screenSize.width * 0.12,
    child: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Catalog()));
        }),
  );
}

bigImageShoes(data) {
  return Container(
    child: Image.memory(
      base64Decode(data),
      scale: 0.75,
    ),
  );
}

shoesName(name) {
  return Container(
      child: Text(name, style: TextStyle(fontSize: 30, fontFamily: "FS")));
}

shoesPrice(price) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 20),
    child: Text(
      "Rp. " + price,
      style: TextStyle(fontSize: 23, fontFamily: "FS"),
    ),
  );
}

shoesDesc(desc) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 55),
    child: Text(
      desc,
      style: TextStyle(fontSize: 15, fontFamily: "Fl"),
      textAlign: TextAlign.center,
    ),
  );
}

shoesType(type) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 12),
    child: Text(
      type,
      style: TextStyle(fontSize: 15, fontFamily: "F"),
      textAlign: TextAlign.center,
    ),
  );
}

shoesGender(gender) {
  return Container(
    child: Text(
      gender,
      style: TextStyle(fontSize: 15, fontFamily: "F"),
      textAlign: TextAlign.center,
    ),
  );
}

cartButton(BuildContext context) {
  var screenSize = MediaQuery.of(context).size;
  return Container(
    margin: EdgeInsets.symmetric(vertical: 15),
    width: screenSize.width * 0.7,
    height: screenSize.height * 0.065,
    decoration: BoxDecoration(
        color: Colors.red,
        gradient: LinearGradient(
          colors: [
            Color(0xffe324d6),
            Color(0xffbb38c7),
            Color(0xffc31ce8),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.all(Radius.circular(30))),
    child: InkWell(
      onTap: (){print("add");},
      child: Center(
        child: Text(
          "Add To Cart",
          style: TextStyle(color: Colors.white, fontFamily: "F", fontSize: 15),
        ),
      ),
    ),
  );
}

listSizeItem(BuildContext context, int data) {
  var screenSize = MediaQuery.of(context).size;
  return Container(
    width: screenSize.width * 0.11,
    height: screenSize.width * 0.11,
    margin: EdgeInsets.symmetric(horizontal: 4),
    decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xffe324d6),
            Color(0xffbb38c7),
            Color(0xffc31ce8),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 3))
        ]),
    child: Center(
      child: Text(
        data.toString(),
        style: TextStyle(fontSize: 14, fontFamily: "FS", color: Colors.white),
      ),
    ),
  );
}
