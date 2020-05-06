import 'package:flutter/material.dart';
import 'package:training/preferences/preferences.dart';
import './catalog.dart';

abstract class CatalogViewModel extends State<Catalog> {
  PreferencesData _preferencesData = PreferencesData();
  String data = "";

  Future<String> tokenData() async {
    String token = await _preferencesData.getDataToken();
    String type = await _preferencesData.getDataTokenType();

    return "$type $token";
  }

  void getDataToken() async {
    data = await tokenData();
    setState(() {});
  }

  @override
  void initState() {
    getDataToken();
    super.initState();
  }
}
