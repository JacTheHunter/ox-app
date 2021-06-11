import 'package:flutter/cupertino.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class Brand_Carousel extends StatefulWidget {
  @override
  _Brand_Carousel createState() => _Brand_Carousel();
}

class _Brand_Carousel extends State<Brand_Carousel> {
  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.fromLTRB(width * .05 , 0, width * .05, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(width * .001, 0, width* .001, 0),
            width: width,
            height: height * .25,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: new Carousel(
                boxFit: BoxFit.fitWidth,
                images: [
                  AssetImage("icons/brand_carousel.png"),
                  AssetImage("icons/brand_carousel.png"),
                  AssetImage("icons/brand_carousel.png"),
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
        ],
      ),
    );
  }
}
