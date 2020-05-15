import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './retail_view_model.dart';

class RetailView extends RetailViewModel {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return listRetail.length > 0
        ? Scaffold(
            body: SingleChildScrollView(
              child: Container(
                width: screenSize.width,
                height: screenSize.height,
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: screenSize.width,
                      height: screenSize.height,
                      color: Colors.white,
                    ),
                    Positioned(
                      top: screenSize.height * 0.1,
                      left: screenSize.width * 0.1,
                      right: screenSize.width * 0.1,
                      child: titleText(context),
                    ),
                    Positioned(
                      top: screenSize.height * 0.17,
                      left: screenSize.width * 0.1,
                      right: screenSize.width * 0.1,
                      child: searchRetail(context),
                    ),
                    Positioned(
                        top: screenSize.height * 0.27,
                        left: screenSize.width * 0.08,
                        right: screenSize.width * 0.08,
                        child: Container(
                          width: screenSize.width,
                          height: screenSize.height * 0.67,
                          child: ListView.builder(
                            itemCount: listRetail.length,
                            itemBuilder: (context, i) => retailCard(
                                context,
                                listRetail[i]['nama'],
                                listRetail[i]['lokasi'],
                                listRetail[i]['telp']),
                          ),
                        ))
                  ],
                ),
              ),
            ),
          )
        : Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }

  titleText(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width,
      child: Center(
        child: Text(
          "Pilih Halaman Retail",
          style: TextStyle(fontSize: 20, fontFamily: "CB"),
        ),
      ),
    );
  }

  searchRetail(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width,
      height: screenSize.height * 0.055,
      child: TextField(
        controller: search,
        decoration: InputDecoration(
          hintText: "Masukkan Pencarian",
          hintStyle: TextStyle(fontSize: 13),
          suffixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        onChanged: (value) {
          onSearchTextChanged(value);
        },
      ),
    );
  }

  retailCard(BuildContext context, String name, String address, String telp) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: screenSize.width,
      height: screenSize.height * 0.1,
      child: Card(
        elevation: 3,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FaIcon(
                FontAwesomeIcons.hotel,
                size: 50,
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      name,
                      style: TextStyle(fontSize: 17, fontFamily: "F"),
                    ),
                    Text(
                      address,
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: "M",
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      telp,
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: "M",
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
