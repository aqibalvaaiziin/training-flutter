import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:training/providers/providers.dart';
import './detail_catalog.dart';

abstract class DetailCatalogViewModel extends State<DetailCatalog> {
  List shoesData = [];

  void getShoesData() {
    Providers.getShoesByName(widget.name).then((value) {
      List rawData = jsonDecode(jsonEncode(value.data));
      for (var i = 0; i < rawData.length; i++) {
        setState(() {
          shoesData.add(rawData[i]);
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getShoesData();
  }
}
