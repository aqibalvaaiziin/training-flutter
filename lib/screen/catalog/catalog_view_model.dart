import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:training/providers/providers.dart';
import 'package:training/redux/action/main_action.dart';
import 'package:training/redux/model/app_model.dart';
import './catalog.dart';

abstract class CatalogViewModel extends State<Catalog> {
  List listCatalog = [];
  List temp = [];
  TextEditingController search = TextEditingController();
  Store<AppState> store;
  double sliderValue = 0.0;
  String info = "";

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

  void getCatalog() {
    Providers.getListShoes().then((value) {
      List rawData = jsonDecode(jsonEncode(value.data));
      for (var i = 0; i < rawData.length; i++) {
        setState(() {
          listCatalog.add(rawData[i]);
          temp.add(rawData[i]);
        });
      }
    });
  }

  void onSliderChanged(data) async {
    List searchResult = List();
    searchResult.addAll(temp);
    if (data != null) {
      List dummy = List();
      for (var i = 0; i < searchResult.length; i++) {
        if (data <= 1000000 &&
            data <= searchResult[i]['harga'] &&
            searchResult[i]['harga'] <= 1000000) {
          info = "< Rp. 1.000.000";
          dummy.add(searchResult[i]);
        } else if (data <= 3000000 &&
            data <= searchResult[i]['harga'] &&
            searchResult[i]['harga'] <= 3000000) {
          info = "< Rp. 3.000.000";
          dummy.add(searchResult[i]);
        } else if (data >= 3000001 &&
            data >= searchResult[i]['harga'] &&
            searchResult[i]['harga'] <= 10000000) {
          info = "> Rp. 3.000.001";
          dummy.add(searchResult[i]);
        }
      }
      setState(() {
        listCatalog.clear();
        listCatalog.addAll(dummy);
      });
      return;
    } else {
      setState(() {
        listCatalog.clear();
        getCatalog();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      store = StoreProvider.of<AppState>(context);
      await initCarts();
      getCatalog();
    });
  }
}
