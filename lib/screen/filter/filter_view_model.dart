import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:training/providers/providers.dart';
import 'package:training/redux/action/main_action.dart';
import 'package:training/redux/model/app_model.dart';
import './filter.dart';

abstract class FilterDataViewModel extends State<FilterData> {
  Store<AppState> store;
  String info = "Geser Slider";

  Future getCatalog() async {
    Providers.getListShoes().then((value) {
      List rawData = jsonDecode(jsonEncode(value.data));
      store.dispatch(
        SetCatalog(catalogs: List.from(rawData)),
      );
    }).catchError((err) => print(err.toString()));
  }

  void onSliderChanged(data) {
    store.dispatch(SetSliderValue(sliderValue: 0));
    store.dispatch(SetSliderValue(sliderValue: data));
    List dummy = [];
    if (data != null) {
      Providers.getListShoes().then((value) {
        List jsonData = jsonDecode(jsonEncode(value.data));
        for (var i = 0; i < jsonData.length; i++) {
          if (data >= 0 && data <= 1000000) {
            if (jsonData[i]['harga'] <= 1000000) {
              info = "< Rp.1.000.000";
              dummy.add(jsonData[i]);
              store.dispatch(SetCatalog(catalogs: dummy));
              print(jsonData[i]['harga']);
            }
          } else if (data >= 0 && data <= 2500000) {
            if (jsonData[i]['harga'] <= 2500000) {
              info = "< Rp.2.500.000";
              dummy.add(jsonData[i]);
              store.dispatch(SetCatalog(catalogs: dummy));
              print(jsonData[i]['harga']);
            }
          } else if (data >= 0 && data >= 3000000) {
            if (jsonData[i]['harga'] >= 3000000) {
              info = "> Rp.3.000.000";
              dummy.add(jsonData[i]);
              store.dispatch(SetCatalog(catalogs: dummy));
              print(jsonData[i]['harga']);
            }
          }
        }
      });
    } else {
      setState(() async {});
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      store = StoreProvider.of<AppState>(context);
      onSliderChanged(store.state.mainState.sliderValue);
    });
  }
}
