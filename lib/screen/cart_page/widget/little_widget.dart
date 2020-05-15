import 'package:flutter/material.dart';
import 'package:training/screen/retail/retail.dart';

textOrder(BuildContext context, int data) {
  var screenSize = MediaQuery.of(context).size;
  return Container(
    width: screenSize.width,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Text(
          "Order Cart",
          style: TextStyle(fontSize: 26, fontFamily: "F", color: Colors.white),
        ),
        Text(
          data.toString() + " Items",
          style: TextStyle(fontSize: 13, fontFamily: "AD", color: Colors.white),
        ),
      ],
    ),
  );
}

checkoutButton(BuildContext context) {
  var screenSize = MediaQuery.of(context).size;
  return Container(
    width: screenSize.width * 0.86,
    height: screenSize.height * 0.06,
    decoration: BoxDecoration(
        color: Color(0xffff8c04),
        borderRadius: BorderRadius.all(Radius.circular(30))),
    child: InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => Retail()),
        );
      },
      child: Center(
        child: Text(
          "CONFIRM ORDER",
          style: TextStyle(
            fontSize: 13,
            fontFamily: "F",
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}

totalText(BuildContext context, int total) {
  var screenSize = MediaQuery.of(context).size;
  return Container(
    width: screenSize.width,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "Total",
          style: TextStyle(color: Colors.white, fontFamily: "CB", fontSize: 20),
        ),
        Container(
          child: Text(
            "Rp. " + total.toString(),
            style:
                TextStyle(color: Colors.white, fontFamily: "CB", fontSize: 20),
          ),
        ),
      ],
    ),
  );
}
