import 'dart:ui';
import 'package:bouncing_widget/bouncing_widget.dart';
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
  bool _tapped = false;
  bool _tapped1 = false;
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
                        color: HexColor("#979797").withOpacity(0.1),
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
                          color: HexColor("#0D3662")),
                    ),
                    Text(
                      "10 часов назад",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: "Montserrat",
                          fontSize: 8,
                          color: HexColor("#B7C1D2")),
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
              dotIncreaseSize: 1.01,
              animationCurve: Curves.fastOutSlowIn,
              autoplay: false,
              dotSize: 8,
              dotSpacing: 25,
              dotIncreasedColor: Colors.white,
              dotColor: Colors.white.withOpacity(0.5),
              dotBgColor: Colors.transparent,
              indicatorBgPadding: 9.0,
              animationDuration: Duration(milliseconds: 1000),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(13, 12, 0, 0),
                child: Text(
                  "A French ready-to-wear brand with strong identity \nand values, Jennyfer is a cool, sexy, low-priced fashion \nbrand created in 1980. Here, RLI speaks with...",
                  style: TextStyle(
                    fontSize: 11,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w400,
                    color: HexColor("#4F4F4F"),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 11, width * .01, 0),
                child: StatefulBuilder(
                  builder: (BuildContext ctx, StateSetter setState) =>
                      BouncingWidget(
                        duration: Duration(milliseconds: 100),
                        scaleFactor: 3,
                        onPressed: () {
                          setState(() {
                            _tapped1 = !_tapped1;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 10,
                                offset: Offset(0, 8), // changes position of shadow
                              ),
                            ],
                          ),
                          child: RawMaterialButton(
                            onPressed: null,
                            elevation: 0,
                            fillColor: Colors.white,
                            child: _tapped1
                                ? SvgPicture.asset('icons/tapped_like.svg')
                                : SvgPicture.asset('icons/like.svg'),
                            padding: EdgeInsets.all(5.0),
                            shape: CircleBorder(),
                          ),
                        ),
                      ),
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
                        color: HexColor("#979797").withOpacity(0.1),
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
                          color: HexColor("#0D3662")),
                    ),
                    Text(
                      "вчера",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: "Montserrat",
                          fontSize: 8,
                          color: HexColor("#B7C1D2")),
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
                        color: HexColor("#979797").withOpacity(0.1),
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
                          color: HexColor("#0D3662")),
                    ),
                    Text(
                      "10 часов назад",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: "Montserrat",
                          fontSize: 8,
                          color: HexColor("#B7C1D2")),
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
              dotIncreaseSize: 1.01,
              animationCurve: Curves.fastOutSlowIn,
              autoplay: false,
              dotSize: 8,
              dotSpacing: 25,
              dotIncreasedColor: Colors.white,
              dotColor: Colors.white.withOpacity(0.5),
              dotBgColor: Colors.transparent,
              indicatorBgPadding: 9.0,
              animationDuration: Duration(milliseconds: 1000),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(13, 12, 0, 0),
                child: Text(
                  "A French ready-to-wear brand with strong identity \nand values, Jennyfer is a cool, sexy, low-priced fashion \nbrand created in 1980. Here, RLI speaks with...",
                  style: TextStyle(
                    fontSize: 11,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w400,
                    color: HexColor("#4F4F4F"),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 11, width * .05, 0),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 10,
                        offset: Offset(0, 8), // changes position of shadow
                      ),
                    ],
                  ),
                  child: StatefulBuilder(
                    builder: (BuildContext ctx, StateSetter setState) =>
                        BouncingWidget(
                          onPressed: () {
                            setState(() {
                              _tapped1 = !_tapped1;
                            });
                          },
                          duration: Duration(milliseconds: 100),
                          scaleFactor: 3,
                          child: ClipOval(
                            child: Container(
                              color: Colors.white,
                              height: height * .04,
                              width: width * .08,
                              child: Center(
                                child: _tapped1
                                    ? SvgPicture.asset('icons/tapped_like.svg')
                                    : SvgPicture.asset("icons/like.svg"),
                              ),
                            ),
                          ),
                        ),
                  ),
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
