import 'package:flutter/material.dart';
import 'package:training/screen/login/login_view_model.dart';

class LoginPageView extends LoginPageViewModel {
  @override
  Widget build(BuildContext context) {
    var data = [
      1,
      3,
      5,
      23,
      523,
      25,
      22,
      35,
      52,
      321,
      4512,
      1,
      31241,
      421,
      421,
      421,
      421
    ];

    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          IconButton(icon: Icon(Icons.photo), onPressed: null),
          IconButton(icon: Icon(Icons.person_pin_circle), onPressed: null)
        ],
      ),
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1.5,
          child: Container(
          margin: EdgeInsets.only(bottom: 350),
            child: ListView.separated(
              padding: EdgeInsets.only(bottom: 300),
              itemCount: data.length,
              separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.grey,
                );
              },
              itemBuilder: (context, i) => ListTile(
                title: Text(data[i].toString()),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
