import 'package:flutter/material.dart';
import 'package:training/screen/detail_catalog/widget/little_widget.dart';
import 'package:training/widget/shopping_cart.dart';
import './detail_catalog_view_model.dart';

class DetailCatalogView extends DetailCatalogViewModel {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: shoesData.length > 0
          ? SingleChildScrollView(
              child: Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: screenSize.width,
                      height: screenSize.height,
                      color: Color(0xfff5f5f5),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 22,
                      right: 22,
                      child: Container(
                        width: screenSize.width,
                        height: screenSize.height * 0.485,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Card(
                          elevation: 20,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: screenSize.height * 0.415,
                      child: Container(
                        width: screenSize.width * 0.82,
                        height: screenSize.width * 0.1,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: Color(0xff808080),
                            blurRadius: 25,
                          ),
                        ]),
                      ),
                    ),
                    Positioned(
                      top: screenSize.height * 0.06,
                      left: 15,
                      child: buttonBack(context),
                    ),
                    Positioned(
                      top: screenSize.height * 0.07,
                      right: 15,
                      child: cartLength(context, 10),
                    ),
                    Positioned(
                      top: screenSize.height * 0.01,
                      right: -screenSize.width * 0.42,
                      child: bigImageShoes(shoesData[0]['gambar']),
                    ),
                    Positioned(
                      top: screenSize.height * 0.56,
                      right: 15,
                      left: 15,
                      child: Center(child: shoesName(shoesData[0]['nama'])),
                    ),
                    Positioned(
                      top: screenSize.height * 0.59,
                      right: 15,
                      left: 15,
                      child: Center(
                          child: shoesPrice(shoesData[0]['harga'].toString())),
                    ),
                    Positioned(
                      top: screenSize.height * 0.649,
                      right: 25,
                      left: 25,
                      child: Container(
                        width: screenSize.width,
                        height: screenSize.height * 0.08,
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        child: Center(
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: shoesData.length,
                              itemBuilder: (context, i) =>
                                  listSizeItem(context, shoesData[i]['ukuran'])),
                        ),
                      ),
                    ),
                    Positioned(
                      top: screenSize.height * 0.74,
                      right: 15,
                      left: 15,
                      child:
                          Center(child: shoesDesc(shoesData[0]['deskripsi'])),
                    ),
                    Positioned(
                      top: screenSize.height * 0.82,
                      right: 15,
                      left: 15,
                      child: Center(child: shoesType(shoesData[0]['tipe'])),
                    ),
                    Positioned(
                      top: screenSize.height * 0.855,
                      right: 15,
                      left: 15,
                      child: Center(child: shoesGender(shoesData[0]['gender'])),
                    ),
                    Positioned(
                      top: screenSize.height * 0.88,
                      right: 15,
                      left: 15,
                      child: Center(child: cartButton(context)),
                    ),
                  ],
                ),
              ),
            )
          : Container(
              child: Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.black,
                ),
              ),
            ),
    );
  }
}
