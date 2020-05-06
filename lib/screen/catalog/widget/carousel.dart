import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

carouselWidget(BuildContext context, data) {
  var screenSize = MediaQuery.of(context).size;

  return Container(
    width: screenSize.width,
    child: CarouselSlider.builder(
      options: CarouselOptions(
        height: screenSize.height * 0.2,
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
      ),
      itemCount: data.length,
      itemBuilder: (context, i) {
        return data.length == 0
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                width: screenSize.width * 0.8,
                height: screenSize.height * 0.18,
                child: Card(
                  elevation: 5,
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.rotationY(math.pi),
                          child: Image(
                            image: MemoryImage(base64Decode(data[i]['gambar'])),
                            width: screenSize.width * 0.4,
                          ),
                        ),
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Introduction",
                              style: TextStyle(
                                  fontFamily: "D",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  letterSpacing: 0.7),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: screenSize.width * 0.36,
                              height: screenSize.height * 0.06,
                              child: Text(
                                data[i]['nama'],
                                style: TextStyle(fontFamily: "F", fontSize: 16),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Container(
                              width: screenSize.width * 0.2,
                              height: screenSize.width * 0.07,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6))),
                              child: InkWell(
                                child: Center(
                                  child: Text(
                                    "Buy Now",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 11),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
      },
    ),
  );
}
