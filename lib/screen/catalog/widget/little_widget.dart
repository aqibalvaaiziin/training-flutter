import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:training/screen/cart_page/cart_page.dart';

searchBar(BuildContext context, TextEditingController data) {
  var screenSize = MediaQuery.of(context).size;
  return Container(
    width: screenSize.width * 0.4,
    height: 40,
    padding: EdgeInsets.symmetric(vertical: 2),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8))),
    child: TextField(
      controller: data,
      cursorColor: Colors.grey,
      style: TextStyle(fontSize: 13, fontFamily: "F"),
      decoration: InputDecoration(
        border: InputBorder.none,
        prefixIcon: Icon(
          Icons.search,
          color: Colors.grey,
        ),
        hintText: "Search...",
        hintStyle: TextStyle(fontSize: 14),
      ),
    ),
  );
}

logoImage(BuildContext context) {
  return Container(
    width: 80,
    height: 80,
    child: Image(
      image: AssetImage("assets/images/logo.png"),
    ),
  );
}

cartLength(BuildContext context, int data) {
  var screenSize = MediaQuery.of(context).size;
  return Container(
    child: Stack(
      children: <Widget>[
        Container(
          width: screenSize.width * 0.1,
          height: screenSize.width * 0.1,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: FaIcon(
              FontAwesomeIcons.shoppingBag,
              size: 17.5,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> CartPage()));
            },
          ),
        ),
        Transform.translate(
            offset: Offset(23, 7),
            child: Container(
              width: screenSize.width * 0.03,
              height: screenSize.width * 0.03,
              decoration:
                  BoxDecoration(color: Colors.black, shape: BoxShape.circle),
              child: Center(
                child: Text(
                  data.toString(),
                  style: TextStyle(fontSize: 7, color: Colors.white),
                ),
              ),
            )),
      ],
    ),
  );
}

iconCategory(BuildContext context) {
  var screenSize = MediaQuery.of(context).size;
  return Container(
    width: screenSize.width,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              width: screenSize.width * 0.12,
              height: screenSize.width * 0.12,
              decoration: BoxDecoration(
                  color: Colors.cyanAccent, shape: BoxShape.circle),
              child: IconButton(
                  icon: FaIcon(FontAwesomeIcons.tshirt, color: Colors.white),
                  onPressed: () {}),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "T-Shirt",
              style: TextStyle(
                  fontSize: 13, fontFamily: "D", fontWeight: FontWeight.w600),
            )
          ],
        ),
        Column(
          children: <Widget>[
            Container(
              width: screenSize.width * 0.12,
              height: screenSize.width * 0.12,
              decoration: BoxDecoration(
                  color: Colors.greenAccent, shape: BoxShape.circle),
              child: IconButton(
                  icon: FaIcon(FontAwesomeIcons.volleyballBall,
                      color: Colors.white),
                  onPressed: () {}),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Volley Ball",
              style: TextStyle(
                  fontSize: 13, fontFamily: "D", fontWeight: FontWeight.w600),
            )
          ],
        ),
        Column(
          children: <Widget>[
            Container(
              width: screenSize.width * 0.12,
              height: screenSize.width * 0.12,
              decoration: BoxDecoration(
                  color: Colors.redAccent, shape: BoxShape.circle),
              child: IconButton(
                  icon: FaIcon(FontAwesomeIcons.shirtsinbulk,
                      color: Colors.white),
                  onPressed: () {}),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Shirt",
              style: TextStyle(
                  fontSize: 13, fontFamily: "D", fontWeight: FontWeight.w600),
            )
          ],
        ),
        Column(
          children: <Widget>[
            Container(
              width: screenSize.width * 0.12,
              height: screenSize.width * 0.12,
              decoration:
                  BoxDecoration(color: Colors.purpleAccent, shape: BoxShape.circle),
              child: IconButton(
                  icon: FaIcon(FontAwesomeIcons.footballBall,
                      color: Colors.white),
                  onPressed: () {}),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Football",
              style: TextStyle(
                  fontSize: 13, fontFamily: "D", fontWeight: FontWeight.w600),
            )
          ],
        ),
      ],
    ),
  );
}

filterButton(BuildContext context) {
  var screenSize = MediaQuery.of(context).size;
  return Container(
    width: screenSize.width,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "All Item",
          style: TextStyle(
            fontFamily: "F",
            fontSize: 20,
          ),
        ),
        GestureDetector(
          onTap: () {
            print("filyerrrt");
          },
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.filter_list,
                  size: 15,
                ),
                SizedBox(
                  width: 3,
                ),
                Text(
                  "Filter",
                  style: TextStyle(
                      fontFamily: "F", fontSize: 13, letterSpacing: 0.4),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}
