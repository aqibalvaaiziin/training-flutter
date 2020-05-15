import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:training/redux/model/app_model.dart';
import 'package:training/redux/model/main_model.dart';
import 'package:training/screen/cart_page/widget/little_widget.dart';
import './cart_page_view_model.dart';
import 'dart:math' as math;

class CartPageView extends CartPageViewModel {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return StoreConnector<AppState, MainState>(
      converter: (store) => store.state.mainState,
      builder: (context, state) {
        return StoreConnector<AppState, MainState>(
          converter: (store) => store.state.mainState,
          builder: (context, state) {
            return state.carts.length > 0
                ? Scaffold(
                    body: SingleChildScrollView(
                      child: Container(
                        width: screenSize.width,
                        height: screenSize.height,
                        child: Stack(
                          children: <Widget>[
                            Container(
                              width: screenSize.width,
                              height: screenSize.height,
                              color: Color(0xff151a30),
                            ),
                            Positioned(
                              top: 0,
                              child: Container(
                                width: screenSize.width,
                                height: screenSize.height * 0.18,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(55),
                                    bottomRight: Radius.circular(55),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: screenSize.height * 0.17,
                              left: screenSize.width * 0.05,
                              right: screenSize.width * 0.05,
                              child: Container(
                                width: screenSize.width * 0.8,
                                height: 1.5,
                                color: Colors.grey,
                              ),
                            ),
                            Positioned(
                              top: screenSize.height * 0.21,
                              left: screenSize.width * 0.085,
                              right: screenSize.width * 0.085,
                              child: textOrder(context, state.carts.length),
                            ),
                            Positioned(
                              top: screenSize.height * 0.27,
                              left: screenSize.width * 0.08,
                              right: screenSize.width * 0.08,
                              child: Container(
                                width: screenSize.width,
                                height: screenSize.height * 0.545,
                                child: ListView.builder(
                                    itemCount: state.carts.length,
                                    itemBuilder: (context, i) {
                                      return dataList(
                                        context: context,
                                        id: state.carts[i]['id_sepatu'],
                                        name: state.carts[i]['Sepatu']['nama'],
                                        size: state.carts[i]['Sepatu']
                                            ['ukuran'],
                                        type: state.carts[i]['Sepatu']['tipe'],
                                        price: state.carts[i]['Sepatu']
                                            ['harga'],
                                        qty: state.carts[i]['jumlah'],
                                        image: state.carts[i]['Sepatu']
                                            ['gambar'],
                                      );
                                    }),
                              ),
                            ),
                            Positioned(
                              bottom: screenSize.height * 0.11,
                              left: screenSize.width * 0.07,
                              right: screenSize.width * 0.07,
                              child: totalText(context, state.total),
                            ),
                            Positioned(
                              bottom: screenSize.height * 0.02,
                              left: screenSize.width * 0.07,
                              right: screenSize.width * 0.07,
                              child: checkoutButton(context),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
          },
        );
      },
    );
  }


  dataList({BuildContext context, int id, String name, int size, String type,
      int price, int qty, String image}) {
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
                                fontSize: screenSize.width * 0.042,
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
                                fontSize: screenSize.width * 0.03,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffb5b4b0)),
                          ),
                        ),
                        Container(
                          child: Text(
                            "Type : " + type,
                            style: TextStyle(
                                fontFamily: "M",
                                fontSize: screenSize.width * 0.03,
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
                                    fontSize: screenSize.width * 0.035,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffffb300),
                                    letterSpacing: 0.5),
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
                        removeData(id);
                      }),
                ))
          ],
        ),
      ),
    );
  }
}
