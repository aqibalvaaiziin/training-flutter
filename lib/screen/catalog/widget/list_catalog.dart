import 'dart:convert';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:training/screen/detail_catalog/detail_catalog.dart';

listShoes(BuildContext context, String nama, String tipe, String gender,
    String gambar, int harga) {
  var screenSize = MediaQuery.of(context).size;
  return GestureDetector(
    onTap: () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => DetailCatalog(name: nama,)));
    },
    child: Container(
      height: screenSize.height * 0.32,
      margin: EdgeInsets.fromLTRB(5, 0, 5, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: screenSize.height * 0.006,
            left: screenSize.width * 0.0125,
            right: screenSize.width * 0.0125,
            child: Container(
              height: screenSize.height * 0.14,
              decoration: BoxDecoration(
                  color: Color(0xffededed),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(math.pi),
                child: Image(
                  width: screenSize.width * 0.3,
                  height: screenSize.height * 0.2,
                  image: MemoryImage(base64Decode(gambar)),
                ),
              ),
            ),
          ),
          Positioned(
            top: screenSize.height * 0.121,
            right: screenSize.width * 0.03,
            left: screenSize.width * 0.03,
            child: Container(
              width: screenSize.width,
              child: Text(
                nama,
                style: TextStyle(
                    fontSize: 15, fontFamily: "D", fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Positioned(
            top: screenSize.height * 0.15,
            right: screenSize.width * 0.035,
            left: screenSize.width * 0.035,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    tipe,
                    style: TextStyle(fontSize: 13, fontFamily: "FL"),
                  ),
                  Text(
                    "Rp. " + harga.toString(),
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: "FL"),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: screenSize.height * 0.1735,
            right: screenSize.width * 0.035,
            left: screenSize.width * 0.035,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    gender,
                    style: TextStyle(fontSize: 13, fontFamily: "FL"),
                  ),
                  Container(
                    width: screenSize.width * 0.1,
                    height: screenSize.width * 0.05,
                    decoration: BoxDecoration(
                        color: Color(0xfff2f2f2),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DetailCatalog(
                                  name: nama,
                                )));
                      },
                      child: Center(
                          child: Text(
                        "Add",
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: "Fl",
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}
