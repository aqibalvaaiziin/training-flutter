import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:training/providers/providers.dart';
import 'package:training/screen/catalog/catalog.dart';

buttonBack(BuildContext context) {
  var screenSize = MediaQuery.of(context).size;
  return Container(
    width: screenSize.width * 0.12,
    height: screenSize.width * 0.12,
    child: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.purple,
          size: 30,
        ),
        onPressed: () {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => Catalog()),
              (Route<dynamic> route) => false);
          print("dsadas");
        }),
  );
}

bigImageShoes(BuildContext context, data) {
  return Container(
    child: Image.memory(
      base64Decode(data),
      scale: MediaQuery.of(context).size.width * 0.00185,
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
      "For " + gender,
      style: TextStyle(fontSize: 15, fontFamily: "F"),
      textAlign: TextAlign.center,
    ),
  );
}

cartButton(BuildContext context, data) {
  var screenSize = MediaQuery.of(context).size;
  return Container(
    margin: EdgeInsets.symmetric(vertical: 15),
    width: screenSize.width * 0.7,
    height: screenSize.height * 0.065,
    decoration: BoxDecoration(
        color: Colors.red,
        gradient: LinearGradient(
          colors: [
            Color(0xffc31ce8),
            Color(0xff8710e3),
            Color(0xff7227e3),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.all(Radius.circular(30))),
    child: InkWell(
      onTap: () {
        Providers.postDataToList(data, 1).then((_) {
          message("DATA DITAMBAHKAN KE KERANJANG");
        });
      },
      child: Center(
        child: Text(
          "Add To Cart",
          style: TextStyle(color: Colors.white, fontFamily: "F", fontSize: 15),
        ),
      ),
    ),
  );
}

listSizeItem(BuildContext context, int data, bool selected) {
  var screenSize = MediaQuery.of(context).size;
  return Container(
    width: screenSize.width * 0.11,
    height: screenSize.width * 0.11,
    margin: EdgeInsets.symmetric(horizontal: 4),
    decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: selected
              ? [
                  Color(0xffc31ce8),
                  Color(0xff8710e3),
                ]
              : [Color(0xffe3e3e3), Colors.grey],
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
        style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            fontFamily: "FS",
            color: selected ? Colors.white : Color(0xff383838)),
      ),
    ),
  );
}

message(String message) {
  return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: Color(0xffb5b5b5),
      textColor: Color(0xff363636),
      fontSize: 16.0);
}
