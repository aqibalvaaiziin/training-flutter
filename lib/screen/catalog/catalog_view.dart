import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:training/redux/model/app_model.dart';
import 'package:training/redux/model/main_model.dart';
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
          ? StoreConnector<AppState, MainState>(
              converter: (store) => store.state.mainState,
              builder: (context, state) {
                return SingleChildScrollView(
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
                          left: screenSize.width * 0.04,
                          child: logoImage(context),
                        ),
                        Positioned(
                          top: screenSize.height * 0.1,
                          right: screenSize.width * 0.2,
                          child: searchBar(context, search),
                        ),
                        Positioned(
                          top: screenSize.height * 0.1,
                          right: screenSize.width * 0.07,
                          child: cartLength(context, state.carts.length),
                        ),
                        Positioned(
                          top: screenSize.height * 0.19,
                          child: carouselWidget(context, listCatalog),
                        ),
                        Positioned(
                          top: screenSize.height * 0.35,
                          right: screenSize.width * 0.1,
                          left: screenSize.width * 0.1,
                          child: iconCategory(context),
                        ),
                        Positioned(
                            top: screenSize.height * 0.45,
                            left: screenSize.width * 0.06,
                            right: screenSize.width * 0.06,
                            child: filterButton(context)),
                        Positioned(
                          left: screenSize.width * 0.02,
                          right: screenSize.width * 0.02,
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
                );
              },
            )
          : Container(
              child: Center(
                child: CircularProgressIndicator(backgroundColor: Colors.black),
              ),
            ),
    );
  }
}
