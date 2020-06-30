import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';

class List_Product_Item extends StatelessWidget {
  final String image;

  List_Product_Item(this.image);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(10.0),
            width: width / 2.1,
            height: height / 2.7,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: new Stack(
                children: <Widget>[
                  Carousel(
                    boxFit: BoxFit.cover,
                    images: [
                      AssetImage(image),
                      AssetImage(image),
                      AssetImage(image),
                      AssetImage(image),
                    ],
                    autoplay: false,
                    dotSize: 4,
                    dotSpacing: 10.0,
                    dotBgColor: Colors.transparent,
                    dotColor: Colors.white,
                    indicatorBgPadding: 9.0,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        width * .34, height * .0075, 0, height * .0075),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        InkWell(
                          onTap: () {},
                          child: ClipOval(
                            child: Container(
                              color: Colors.white,
                              height: height * .04, // height of the button
                              width: width * .08, // width of the button
                              child: Center(
                                child: SvgPicture.asset("icons/heart.svg" , fit: BoxFit.contain,),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: ClipOval(
                            child: Container(
                              color: Colors.white,
                              height: height * .038, // height of the button
                              width: width * .078, // wiidth of the button
                              child: Center(
                                child: SvgPicture.asset("icons/basket.svg"),
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
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(width * .03, 0, 0, 0),
          child: Text(
            "Платье женское для",
            style: TextStyle(
                fontSize: 11 / textScaleFactor,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
                color: Hexcolor("#627285")),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(width * .03, 0, 0, 0),
          child: Text(
            "5 500 000",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontFamily: 'Montserrat',
              fontSize: 14 / textScaleFactor,
              color: Hexcolor('#0D3662'),
            ),
          ),
        ),
      ],
    );
  }
}
