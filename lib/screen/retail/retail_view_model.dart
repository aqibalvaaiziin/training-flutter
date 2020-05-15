import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:training/providers/providers.dart';
import './retail.dart';

abstract class RetailViewModel extends State<Retail> {
  TextEditingController search = TextEditingController();
  List listRetail = [];
  List temp = [];

  void getRetail() {
    Providers.getListRetail().then((value) {
      List rawData = jsonDecode(jsonEncode(value.data));
      for (var i = 0; i < rawData.length; i++) {
        setState(() {
          listRetail.add(rawData[i]);
          temp.add(rawData[i]);
        });
      }
    });
  }

  void onSearchTextChanged(String text) async {
    List searchResult = List();
    searchResult.addAll(temp);
    if (search != null) {
      List dummy = List();
      searchResult.forEach((item) {
        if (item['nama'].toLowerCase().contains(text) ||
            item['lokasi'].toLowerCase().contains(text)) {
          dummy.add(item);
        }
      });
      setState(() {
        listRetail.clear();
        listRetail.addAll(dummy);
      });
      return;
    } else {
      setState(() {
        listRetail.clear();
        getRetail();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getRetail();
  }
}
