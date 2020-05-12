import 'dart:convert';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

listCart(BuildContext context, String name, int size, String type, int price,
    int qty, String image) {
  var screenSize = MediaQuery.of(context).size;
  return Container(
    width: screenSize.width,
    margin: EdgeInsets.symmetric(vertical: 2),
    child: Container(
      width: screenSize.width,
      child: Stack(
        children: <Widget>[
          Container(
            width: screenSize.width,
            height: screenSize.height * 0.16,
            padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: screenSize.width * 0.22,
                  height: screenSize.width * 0.22,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(22)),
                  ),
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(math.pi),
                    child: Image(
                      image: MemoryImage(base64Decode(image)),
                    ),
                  ),
                ),
                Container(
                  height: screenSize.height * 0.2,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Text(
                          name,
                          style: TextStyle(
                              fontFamily: "M",
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.4),
                        ),
                      ),
                      SizedBox(
                        height: screenSize.height * 0.003,
                      ),
                      Container(
                        child: Text(
                          "Size   : " + size.toString(),
                          style: TextStyle(
                              fontFamily: "M",
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffb5b4b0)),
                        ),
                      ),
                      Container(
                        child: Text(
                          "Type : " + type,
                          style: TextStyle(
                              fontFamily: "M",
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffb5b4b0)),
                        ),
                      ),
                      SizedBox(
                        height: screenSize.height * 0.01,
                      ),
                      Container(
                        width: screenSize.width * 0.51,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Rp . " + price.toString(),
                              style: TextStyle(
                                fontFamily: "FS",
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffffb300),
                              ),
                            ),
                            Text(
                              "x " + qty.toString(),
                              style: TextStyle(
                                fontFamily: "M",
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffb5b4b0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
              right: 0,
              child: Container(
                child: IconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.times,
                      color: Color(0xffffb300),
                    ),
                    onPressed: () {
                      print("Hapus");
                    }),
              ))
        ],
      ),
    ),
  );
}
