import 'package:flutter/material.dart';
import './catalog_view_model.dart';

class CatalogView extends CatalogViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(""+data)),
    );
  }
}
