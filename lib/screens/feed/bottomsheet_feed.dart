import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuckingnum/screens/catalog/forgirls/list_view_girls.dart';
import 'package:fuckingnum/screens/shopingpage/list_of_products.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_pro/carousel_pro.dart';

import 'PopUpDialog.dart';

class bottomSheetFeed extends StatefulWidget {
  @override
  _bottomSheetFeed createState() => _bottomSheetFeed();
}

class _bottomSheetFeed extends State<bottomSheetFeed> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(29),
            topLeft: Radius.circular(29),
          ),
          color: Colors.white),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, width * .03, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: width / 18,
                  height: height * .01,
                  decoration: BoxDecoration(
                    color: Hexcolor("#EBF1FD"),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                SizedBox(width: width * .05),
                Container(
                  width: width / 3,
                  height: height * .01,
                  decoration: BoxDecoration(
                    color: Hexcolor("#EBF1FD"),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                SizedBox(width: width * .05),
                Container(
                  width: width / 18,
                  height: height * .01,
                  decoration: BoxDecoration(
                    color: Hexcolor("#EBF1FD"),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18, 25, 14, 14),
            child: Row(
              children: <Widget>[
                Container(
                  height: height * .05, // height of the button
                  width: width * .09,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                        image: AssetImage("icons/jenyfer.png"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.all(
                      Radius.circular(29.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Hexcolor("#979797").withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 14),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Jenyfer",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: "Montserrat",
                          fontSize: 12,
                          color: Hexcolor("#0D3662")),
                    ),
                    Text(
                      "10 часов назад",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: "Montserrat",
                          fontSize: 8,
                          color: Hexcolor("#B7C1D2")),
                    ),
                  ],
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return PopUpDialog();
                  });
            },
            child: Container(
              height: 303,
              width: MediaQuery.of(context).size.width,
              child: Carousel(
                boxFit: BoxFit.cover,
                images: [
                  AssetImage("icons/image1.jpg"),
                  AssetImage("icons/image1.jpg"),
                  AssetImage("icons/image1.jpg"),
                ],
                autoplay: false,
                dotSize: 3.5,
                dotSpacing: 15,
                dotBgColor: Colors.transparent,
                indicatorBgPadding: 9.0,
                animationCurve: Curves.fastOutSlowIn,
                animationDuration: Duration(milliseconds: 1000),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(
                    width * .04, height * .02, width * .01, 0),
                child: Text(
                  "A French ready-to-wear brand with strong identity \nand values, Jennyfer is a cool, sexy, low-priced fashion \nbrand created in 1980. Here, RLI speaks with...",
                  style: TextStyle(
                    fontSize: 11 / textScaleFactor,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w400,
                    color: Hexcolor("#4F4F4F"),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, height * .02, width * .01, 0),
                child: RawMaterialButton(
                  onPressed: () {},
                  elevation: 2.0,
                  fillColor: Colors.white,
                  child: SvgPicture.asset('icons/like.svg'),
                  padding: EdgeInsets.all(5.0),
                  shape: CircleBorder(),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                width * .04, height * .05, width * .01, height * .01),
            child: Row(
              children: <Widget>[
                Container(
                  height: height * .05, // height of the button
                  width: width * .09,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                        image: AssetImage("icons/derimod.png"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.all(
                      Radius.circular(29.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Hexcolor("#979797").withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: width * .03),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Derimod",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: "Montserrat",
                          fontSize: 12 / textScaleFactor,
                          color: Hexcolor("#0D3662")),
                    ),
                    Text(
                      "12 часов назад",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: "Montserrat",
                          fontSize: 8 / textScaleFactor,
                          color: Hexcolor("#B7C1D2")),
                    ),
                  ],
                ),
              ],
            ),
          ),
          List_View_Girls(),
          Padding(
            padding: EdgeInsets.fromLTRB(width * .04, 0, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "New collection 2020 arrived. Start checking in our \nonline store 😎😎.",
                  style: TextStyle(
                    fontSize: 11 / textScaleFactor,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w400,
                    color: Hexcolor("#4F4F4F"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, height * .02, width * .01, 0),
                  child: RawMaterialButton(
                    onPressed: () {},
                    elevation: 2.0,
                    fillColor: Colors.white,
                    child: SvgPicture.asset('icons/like.svg'),
                    padding: EdgeInsets.all(5.0),
                    shape: CircleBorder(),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                width * .04, height * .05, width * .01, height * .01),
            child: Row(
              children: <Widget>[
                Container(
                  height: height * .05, // height of the button
                  width: width * .09,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                        image: AssetImage("icons/jenyfer.png"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.all(
                      Radius.circular(29.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Hexcolor("#979797").withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: width * .03),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Jenyfer",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: "Montserrat",
                          fontSize: 12 / textScaleFactor,
                          color: Hexcolor("#0D3662")),
                    ),
                    Text(
                      "вчера",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: "Montserrat",
                        fontSize: 8 / textScaleFactor,
                        color: Hexcolor("#B7C1D2"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          List_Of_Products(),
          SizedBox(height: height * .05),
        ],
      ),
    );
  }
}
