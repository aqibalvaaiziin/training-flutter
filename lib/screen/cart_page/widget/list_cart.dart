import 'dart:convert';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:redux/redux.dart';
import 'package:training/providers/providers.dart';
import 'package:training/redux/action/main_action.dart';
import 'package:training/redux/model/app_model.dart';
import 'package:training/screen/detail_catalog/widget/little_widget.dart';

class ListCart extends StatefulWidget {
  final int id;
  final String name;
  final int size;
  final String type;
  final int price;
  final int qty;
  final String image;

  ListCart(
      {this.id,
      this.name,
      this.size,
      this.type,
      this.price,
      this.qty,
      this.image});

  @override
  _ListCartState createState() => _ListCartState();
}

class _ListCartState extends State<ListCart> {
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
    print("Data : $total");
    return total;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await initCarts();
      store = StoreProvider.of<AppState>(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width,
      margin: EdgeInsets.symmetric(vertical: 2),
      child: Container(
        width: screenSize.width,
        child: Stack(
          children: <Widget>[
            Container(
              width: screenSize.width,
              height: screenSize.height * 0.16,
              padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: screenSize.width * 0.22,
                    height: screenSize.width * 0.22,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(22)),
                    ),
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(math.pi),
                      child: Image(
                        image: MemoryImage(base64Decode(widget.image)),
                      ),
                    ),
                  ),
                  Container(
                    height: screenSize.height * 0.2,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Text(
                            widget.name,
                            style: TextStyle(
                                fontFamily: "M",
                                fontSize: screenSize.width * 0.042,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.4),
                          ),
                        ),
                        SizedBox(
                          height: screenSize.height * 0.003,
                        ),
                        Container(
                          child: Text(
                            "Size   : " + widget.size.toString(),
                            style: TextStyle(
                                fontFamily: "M",
                                fontSize: screenSize.width * 0.03,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffb5b4b0)),
                          ),
                        ),
                        Container(
                          child: Text(
                            "Type : " + widget.type,
                            style: TextStyle(
                                fontFamily: "M",
                                fontSize: screenSize.width * 0.03,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffb5b4b0)),
                          ),
                        ),
                        SizedBox(
                          height: screenSize.height * 0.01,
                        ),
                        Container(
                          width: screenSize.width * 0.51,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Rp . " + widget.price.toString(),
                                style: TextStyle(
                                    fontFamily: "FS",
                                    fontSize: screenSize.width * 0.035,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffffb300),
                                    letterSpacing: 0.5),
                              ),
                              Text(
                                "x " + widget.qty.toString(),
                                style: TextStyle(
                                  fontFamily: "M",
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffb5b4b0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Positioned(
                right: 0,
                child: Container(
                  child: IconButton(
                      icon: FaIcon(
                        FontAwesomeIcons.times,
                        color: Color(0xffffb300),
                      ),
                      onPressed: () {
                        Providers.removeDataCart(widget.id).then((_) async {
                          message("Data Dihapus");
                          await initCarts();
                          setState(() {});
                        });
                      }),
                ))
          ],
        ),
      ),
    );
  }
}
