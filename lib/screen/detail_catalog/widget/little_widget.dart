import 'package:flutter/material.dart';

buttonBack(BuildContext context) {
  var screenSize = MediaQuery.of(context).size;
  return Container(
    width: screenSize.width * 0.12,
    height: screenSize.width * 0.12,
    child: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          print("oej");
        }),
  );
}
