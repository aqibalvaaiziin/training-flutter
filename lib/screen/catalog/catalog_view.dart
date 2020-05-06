import 'package:flutter/material.dart';
import 'package:training/screen/catalog/widget/carousel.dart';
import 'package:training/screen/catalog/widget/list_catalog.dart';
import 'package:training/screen/catalog/widget/little_widget.dart';
import './catalog_view_model.dart';

class CatalogView extends CatalogViewModel {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        child: Stack(
          children: <Widget>[
            Container(
              width: screenSize.width,
              height: screenSize.height,
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: screenSize.width,
                height: screenSize.height * 0.55,
                decoration: BoxDecoration(
                    color: Color(0xfff2f2f2),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
              ),
            ),
            Positioned(
              child: Container(
                width: screenSize.width,
                height: screenSize.height * 0.3,
                color: Colors.black,
              ),
            ),
            Positioned(
              top: 33,
              left: 30,
              child: logoImage(context),
            ),
            Positioned(
              top: 52,
              right: 30,
              child: searchBar(context, search),
            ),
            Positioned(
              top: 135,
              child: carouselWidget(context, listCatalog),
            ),
            Positioned(
                top: 330,
                left: 28,
                child: Text(
                  "All Item",
                  style: TextStyle(
                    fontFamily: "F",
                    fontSize: 20,
                  ),
                )),
            Positioned(
              left: 10,
              right: 10,
              top: 360,
              child: Container(
                width: screenSize.width,
                height: screenSize.height * 0.48,
                child: ListView.builder(
                    itemCount: listCatalog.length,
                    itemBuilder: (context, i) => ListTile(
                          title: listShoes(listCatalog[i]['nama']),
                        )),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
