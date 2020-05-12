import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:training/redux/model/app_model.dart';
import 'package:training/redux/model/main_model.dart';
import 'package:training/screen/cart_page/widget/list_cart.dart';
import 'package:training/screen/cart_page/widget/little_widget.dart';
import './cart_page_view_model.dart';

class CartPageView extends CartPageViewModel {
  int total = 0;

  int totalAll(int a, int b) {
    return total += a * b;
  }

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
                              child: textOrder(context),
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
                                      totalAll(
                                        state.carts[i]['Sepatu']['harga'],
                                        state.carts[i]['jumlah'],
                                      );
                                      return listCart(
                                        context,
                                        state.carts[i]['Sepatu']['nama'],
                                        state.carts[i]['Sepatu']['ukuran'],
                                        state.carts[i]['Sepatu']['tipe'],
                                        state.carts[i]['Sepatu']['harga'],
                                        state.carts[i]['jumlah'],
                                        state.carts[i]['Sepatu']['gambar'],
                                      );
                                    }),
                              ),
                            ),
                            Positioned(
                              bottom: screenSize.height * 0.11,
                              left: screenSize.width * 0.07,
                              right: screenSize.width * 0.07,
                              child: totalText(context, total),
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
}
