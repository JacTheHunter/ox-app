import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:flutter_svg/flutter_svg.dart";
import 'package:hexcolor/hexcolor.dart';

class Product_Banner extends StatefulWidget {
  @override
  _Product_Banner createState() => _Product_Banner();
}

class _Product_Banner extends State<Product_Banner> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Padding(
      padding: EdgeInsets.fromLTRB(width * .045, 0, width * .045, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          new Container(
            padding: EdgeInsets.all(10.0),
            width: width,
            height: height * .6,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: new Stack(
                children: <Widget>[
                  Carousel(
                    boxFit: BoxFit.cover,
                    images: [
                      AssetImage("images/banner1.jpg"),
                      AssetImage("images/banner1.jpg"),
                      AssetImage("images/banner1.jpg"),
                    ],
                    dotIncreaseSize: 1.01,
                    animationCurve: Curves.fastOutSlowIn,
                    autoplay: false,
                    dotSize: 6,
                    dotSpacing: 18,
                    dotIncreasedColor: Colors.white,
                    dotColor: Colors.white.withOpacity(0.5),
                    dotBgColor: Colors.transparent,
                    indicatorBgPadding: 9.0,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        width * .02, height * .011, 0, height * .01),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          child: Container(
                            height: height  *.05, // height of the button
                            //width: width  *.38, // wi
                            decoration: BoxDecoration(
                              color: HexColor("#FECE2F"),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 5,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(20),
                            ), // dth of the button
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(width  *.02, height * .01, width * .02, height * .01),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  SvgPicture.asset("icons/heart1.svg"),
                                  SizedBox(width: width * .01),
                                  Text(
                                    "LOOK НЕДЕЛИ",
                                    style: TextStyle(
                                      fontSize: 14 / textScaleFactor,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
