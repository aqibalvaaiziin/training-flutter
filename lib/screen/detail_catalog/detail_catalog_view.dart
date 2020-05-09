import 'package:flutter/material.dart';
import 'package:training/screen/detail_catalog/widget/little_widget.dart';
import './detail_catalog_view_model.dart';

class DetailCatalogView extends DetailCatalogViewModel {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: <Widget>[
              Container(
                width: screenSize.width,
                height: screenSize.height,
                color: Colors.white,
              ),
              Positioned(
                bottom: 0,
                left: 15,
                right: 15,
                child: Container(
                  width: screenSize.width,
                  height: screenSize.height *0.3,
                  color: Colors.redAccent,
                ),
              ),
              Positioned(
                top: screenSize.height * 0.04,
                left: 15,
                child: buttonBack(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
