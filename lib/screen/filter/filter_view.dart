import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:training/redux/model/app_model.dart';
import 'package:training/redux/model/main_model.dart';
import 'package:training/screen/catalog/catalog.dart';
import './filter_view_model.dart';

class FilterDataView extends FilterDataViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoreConnector<AppState, MainState>(
        converter: (store) => store.state.mainState,
        builder: (context, state) {
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Atur Harga",
                  style: TextStyle(fontSize: 30),
                ),
                Slider(
                    value: state.sliderValue,
                    min: 0,
                    max: 5000000,
                    divisions: 2,
                    label: info,
                    onChanged: (val) {
                      setState(() {
                        onSliderChanged(val);
                      });
                    }),
                Text(
                  info,
                  style: TextStyle(fontSize: 30),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Catalog()));
                  },
                  child: Text("balek"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
