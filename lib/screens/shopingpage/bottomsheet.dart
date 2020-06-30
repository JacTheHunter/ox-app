import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'list_of_products.dart';

class Bottom_Sheet extends StatefulWidget {
  @override
  _Bottom_Sheet createState() => _Bottom_Sheet();
}

class _Bottom_Sheet extends State<Bottom_Sheet> {

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
            padding: EdgeInsets.fromLTRB(18, 25, 14, 14),
            child: Row(
              children: <Widget>[
                Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                        image: AssetImage("icons/polo.png"), fit: BoxFit.cover),
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
                SizedBox(width: width * .01),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "U.S. POLO ASSN.",
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
          Container(
            height: 303,
            width: MediaQuery.of(context).size.width,
            child: Carousel(
              boxFit: BoxFit.cover,
              images: [
                AssetImage("icons/image1.jpg"),
                AssetImage("icons/image1.jpg"),
                AssetImage("icons/image1.jpg"),
              ],
              autoplay: true,
              dotSize: 3.5,
              dotSpacing: 15,
              dotBgColor: Colors.transparent,
              indicatorBgPadding: 9.0,
              animationCurve: Curves.fastOutSlowIn,
              animationDuration: Duration(milliseconds: 1000),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(13, 12, width * .03, 0),
                child: Text(
                  "A French ready-to-wear brand with strong identity \nand values, Jennyfer is a cool, sexy, low-priced fashion \nbrand created in 1980. Here, RLI speaks with...",
                  style: TextStyle(
                    fontSize: 11,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w400,
                    color: Hexcolor("#4F4F4F"),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 11, 0, 0),
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
            padding: EdgeInsets.fromLTRB(18, 25, 14, 14),
            child: Row(
              children: <Widget>[
                Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                        image: AssetImage("icons/polo.png"), fit: BoxFit.cover),
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
                      "U.S. POLO ASSN.",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: "Montserrat",
                          fontSize: 12,
                          color: Hexcolor("#0D3662")),
                    ),
                    Text(
                      "вчера",
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
          List_Of_Products(),
          Padding(
            padding: EdgeInsets.fromLTRB(18, 25, 14, 14),
            child: Row(
              children: <Widget>[
                Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                        image: AssetImage("icons/polo.png"), fit: BoxFit.cover),
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
                      "U.S. POLO ASSN.",
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
          Container(
            height: 303,
            width: MediaQuery.of(context).size.width,
            child: Carousel(
              boxFit: BoxFit.cover,
              images: [
                AssetImage("icons/image11.jpg"),
                AssetImage("icons/image11.jpg"),
                AssetImage("icons/image11.jpg"),
              ],
              autoplay: true,
              dotSize: 3.5,
              dotSpacing: 15,
              dotBgColor: Colors.transparent,
              indicatorBgPadding: 9.0,
              animationCurve: Curves.fastOutSlowIn,
              animationDuration: Duration(milliseconds: 1000),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(13, 12, width * .03, 0),
                child: Text(
                  "A French ready-to-wear brand with strong identity \nand values, Jennyfer is a cool, sexy, low-priced fashion \nbrand created in 1980. Here, RLI speaks with...",
                  style: TextStyle(
                    fontSize: 11,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w400,
                    color: Hexcolor("#4F4F4F"),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 11, 0, 0),
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
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
