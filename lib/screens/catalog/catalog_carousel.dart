import 'package:flutter/cupertino.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class Carousel_Guess extends StatefulWidget {
  @override
  _Carousel_Guess createState() => _Carousel_Guess();
}

class _Carousel_Guess extends State<Carousel_Guess> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.fromLTRB(width * .047, 0, width * .047, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(height *  .013),
            width: width,
            height: height * .25,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: new Carousel(
                boxFit: BoxFit.cover,
                images: [
                  AssetImage("images/guess.png"),
                  AssetImage("images/guess.png"),
                  AssetImage("images/guess.png")
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
          ),
        ],
      ),
    );
  }
}
