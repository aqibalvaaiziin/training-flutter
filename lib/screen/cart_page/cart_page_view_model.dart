import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:training/providers/providers.dart';
import 'package:training/redux/action/main_action.dart';
import 'package:training/redux/model/app_model.dart';
import './cart_page.dart';

abstract class CartPageViewModel extends State<CartPage> {
  Store<AppState> store;

  Future initCarts() async {
    Providers.getListCart().then((value) {
      store.dispatch(
        SetCart(
          carts: List.from(
            jsonDecode(jsonEncode(value.data)),
          ),
        ),
      );
    }).catchError((err) => print(err.toString()));
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await initCarts();
      store = StoreProvider.of<AppState>(context);
    });
  }
}
