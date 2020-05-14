import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:training/redux/model/app_model.dart';
import 'package:training/redux/model/main_model.dart';
import 'package:training/screen/detail_catalog/widget/little_widget.dart';
import 'package:training/widget/shopping_cart.dart';
import './detail_catalog_view_model.dart';

class DetailCatalogView extends DetailCatalogViewModel {
  var selectedIndex;
  int idData = 0;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: shoesData.length > 0
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
                          color: Color(0xfff5f5f5),
                        ),
                        Positioned(
                          bottom: 0,
                          left: screenSize.width * 0.06,
                          right: screenSize.width * 0.06,
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
                          top: screenSize.height * 0.002,
                          right: -screenSize.width * 0.42,
                          child: bigImageShoes(context, shoesData[0]['gambar']),
                        ),
                        Positioned(
                          top: screenSize.height * 0.56,
                          right: screenSize.width * 0.06,
                          left: screenSize.width * 0.06,
                          child: Center(child: shoesName(shoesData[0]['nama'])),
                        ),
                        Positioned(
                          top: screenSize.height * 0.59,
                          right: screenSize.width * 0.06,
                          left: screenSize.width * 0.06,
                          child: Center(
                              child:
                                  shoesPrice(shoesData[0]['harga'].toString())),
                        ),
                        Positioned(
                          top: screenSize.height * 0.649,
                          right: screenSize.width * 0.08,
                          left: screenSize.width * 0.08,
                          child: Container(
                            width: screenSize.width,
                            height: screenSize.height * 0.08,
                            margin: EdgeInsets.symmetric(horizontal: 88.5),
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: shoesData.length,
                                itemBuilder: (context, i) => GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedIndex = i;
                                          idData = shoesData[i]['id_sepatu'];
                                        });
                                      },
                                      child: listSizeItem(
                                          context,
                                          shoesData[i]['ukuran'],
                                          selectedIndex == i),
                                    )),
                          ),
                        ),
                        Positioned(
                          top: screenSize.height * 0.74,
                          right: screenSize.width * 0.06,
                          left: screenSize.width * 0.06,
                          child: Center(
                              child: shoesDesc(shoesData[0]['deskripsi'])),
                        ),
                        Positioned(
                          top: screenSize.height * 0.825,
                          right: screenSize.width * 0.06,
                          left: screenSize.width * 0.06,
                          child: Center(child: shoesType(shoesData[0]['tipe'])),
                        ),
                        Positioned(
                          top: screenSize.height * 0.865,
                          right: screenSize.width * 0.06,
                          left: screenSize.width * 0.06,
                          child: Center(
                              child: shoesGender(shoesData[0]['gender'])),
                        ),
                        Positioned(
                          top: screenSize.height * 0.88,
                          right: screenSize.width * 0.06,
                          left: screenSize.width * 0.06,
                          child: Center(
                              child: cartButton(context, idData)),
                        ),
                        Positioned(
                          top: screenSize.height * 0.06,
                          left: screenSize.width * 0.06,
                          child: buttonBack(context),
                        ),
                        Positioned(
                          top: screenSize.height * 0.065,
                          right: screenSize.width * 0.06,
                          child: cartLengthDetail(context, state.carts.length),
                        ),
                      ],
                    ),
                  ),
                );
              },
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
