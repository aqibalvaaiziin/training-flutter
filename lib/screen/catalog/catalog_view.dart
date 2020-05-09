import 'package:flutter/material.dart';
import 'package:training/screen/catalog/widget/carousel.dart';
import 'package:training/screen/catalog/widget/list_catalog.dart';
import 'package:training/screen/catalog/widget/little_widget.dart';
import 'package:training/widget/shopping_cart.dart';
import './catalog_view_model.dart';

class CatalogView extends CatalogViewModel {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: listCatalog.length > 1
          ? SingleChildScrollView(
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
                        height: screenSize.height * 0.56,
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
                      top: screenSize.height * 0.08,
                      left: 30,
                      child: logoImage(context),
                    ),
                    Positioned(
                      top: screenSize.height * 0.1,
                      right: 75,
                      child: searchBar(context, search),
                    ),
                    Positioned(
                      top: screenSize.height * 0.1,
                      right: 25,
                      child: cartLength(context, 22),
                    ),
                    Positioned(
                      top: screenSize.height * 0.19,
                      child: carouselWidget(context, listCatalog),
                    ),
                    Positioned(
                      top: screenSize.height * 0.35,
                      right: 40,
                      left: 40,
                      child: iconCategory(context),
                    ),
                    Positioned(
                        top: screenSize.height * 0.45,
                        left: 28,
                        right: 28,
                        child: filterButton(context)),
                    Positioned(
                      left: 10,
                      right: 10,
                      top: screenSize.height * 0.49,
                      child: Container(
                        width: screenSize.width,
                        height: screenSize.height * 0.48,
                        padding: EdgeInsets.only(bottom: 15),
                        child: GridView.builder(
                          gridDelegate:
                              new SliverGridDelegateWithFixedCrossAxisCount(
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
            )
          : Container(
              child: Center(
                child: CircularProgressIndicator(backgroundColor: Colors.black),
              ),
            ),
    );
  }
}
