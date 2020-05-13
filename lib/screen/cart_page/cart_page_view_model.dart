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
    Providers.getListCart().then((value) async {
      List dataList = jsonDecode(jsonEncode(value.data));
      store.dispatch(
        SetCart(carts: List.from(dataList)),
      );
      store.dispatch(SetTotal(total: await getTotal(dataList)));
    }).catchError((err) => print(err.toString()));
  }

  Future<int> getTotal(dataList) async {
    int total = 0;
    for (var i = 0; i < store.state.mainState.carts.length; i++) {
      setState(() {
        total += dataList[i]['jumlah'] * dataList[i]['Sepatu']['harga'];
      });
    }
    return total;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      store = StoreProvider.of<AppState>(context);
      await initCarts();
    });
  }
}
