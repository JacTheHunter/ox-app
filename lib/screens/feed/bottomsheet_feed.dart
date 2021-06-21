import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuckingnum/screens/catalog/forgirls/list_view_girls.dart';
import 'package:fuckingnum/screens/shopingpage/list_of_products.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'PopUpDialog.dart';

class bottomSheetFeed extends StatefulWidget {
  @override
  _bottomSheetFeed createState() => _bottomSheetFeed();
}

class _bottomSheetFeed extends State<bottomSheetFeed> {
  bool _tapped1 = false;
  bool _tapped2 = false;

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
                    color: HexColor("#EBF1FD"),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                SizedBox(width: width * .05),
                Container(
                  width: width / 3,
                  height: height * .01,
                  decoration: BoxDecoration(
                    color: HexColor("#EBF1FD"),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                SizedBox(width: width * .05),
                Container(
                  width: width / 18,
                  height: height * .01,
                  decoration: BoxDecoration(
                    color: HexColor("#EBF1FD"),
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
                      "Jenyfer",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: "Montserrat",
                          fontSize: 12 / textScaleFactor,
                          color: HexColor("#0D3662")),
                    ),
                    Text(
                      "10 часов назад",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: "Montserrat",
                          fontSize: 8 / textScaleFactor,
                          color: HexColor("#B7C1D2")),
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
                },
              );
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
                dotIncreaseSize: 1.01,
                animationCurve: Curves.fastOutSlowIn,
                autoplay: false,
                dotSize: 6,
                dotSpacing: 10,
                dotIncreasedColor: Colors.white,
                dotColor: Colors.white.withOpacity(0.5),
                dotBgColor: Colors.transparent,
                indicatorBgPadding: 9.0,
                animationDuration: Duration(milliseconds: 1000),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(
                    13, 12, 0, 0),
                child: Text(
                  "A French ready-to-wear brand with strong identity \nand values, Jennyfer is a cool, sexy, low-priced fashion \nbrand created in 1980. Here, RLI speaks with...",
                  style: TextStyle(
                    fontSize: 11 / textScaleFactor,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w400,
                    color: HexColor("#4F4F4F"),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, height * .02, width * .01, 0),
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
                        color: HexColor("#979797").withOpacity(0.1),
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
                          color: HexColor("#0D3662")),
                    ),
                    Text(
                      "12 часов назад",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: "Montserrat",
                          fontSize: 8 / textScaleFactor,
                          color: HexColor("#B7C1D2")),
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
                    color: HexColor("#4F4F4F"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, height * .02, width * .01, 0),
                  child: StatefulBuilder(
                    builder: (BuildContext ctx, StateSetter setState) =>
                        BouncingWidget(
                          duration: Duration(milliseconds: 100),
                          scaleFactor: 3,
                          onPressed: () {
                            setState(() {
                              _tapped2 = !_tapped2;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  blurRadius: 10,
                                  offset:
                                  Offset(0, 8), // changes position of shadow
                                ),
                              ],
                            ),
                            child: RawMaterialButton(
                              onPressed: null,
                              elevation: 0,
                              fillColor: Colors.white,
                              child: _tapped2
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
                        color: HexColor("#979797").withOpacity(0.1),
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
                          color: HexColor("#0D3662")),
                    ),
                    Text(
                      "вчера",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: "Montserrat",
                        fontSize: 8 / textScaleFactor,
                        color: HexColor("#B7C1D2"),
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
