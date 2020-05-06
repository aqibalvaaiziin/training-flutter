import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:training/providers/providers.dart';
import './catalog.dart';

abstract class CatalogViewModel extends State<Catalog> {
  List listCatalog = [];
  TextEditingController search = TextEditingController();

  void getCatalog() {
    Providers.getListShoes().then((value) {
      List rawData = jsonDecode(jsonEncode(value.data));
      for (var i = 0; i < rawData.length; i++) {
        setState(() {
          listCatalog.add(rawData[i]);
        });
        print(listCatalog[i]['nama']);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getCatalog();
  }
}
