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
                height: screenSize.height * 0.53,
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
              right: 75,
              child: searchBar(context, search),
            ),
            Positioned(
              top: 52,
              right: 25,
              child: cartLength(context, 22),
            ),
            Positioned(
              top: 135,
              child: carouselWidget(context, listCatalog),
            ),
            Positioned(
                top: 413,
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
              top: 445,
              child: Container(
                width: screenSize.width,
                height: screenSize.height * 0.48,
                padding: EdgeInsets.only(bottom: 15),
                child: GridView.builder(
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: listCatalog.length,
                  itemBuilder: (context, i) => listShoes(
                    context,
                    listCatalog[i]['nama'],
                    listCatalog[i]['tipe'],
                    listCatalog[i]['gender'],
                    listCatalog[i]['gambar'],
                    listCatalog[i]['harga'],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
