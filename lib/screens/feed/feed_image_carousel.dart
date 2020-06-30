import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class Feed_Image_Carousel extends StatefulWidget {
  @override
  _Feed_Image_Carousel createState() => _Feed_Image_Carousel();
}

class _Feed_Image_Carousel extends State<Feed_Image_Carousel> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Padding(
      padding: EdgeInsets.fromLTRB(width * .05, width * .1, width * .05, 0),
      child: Container(
        width: width,
        height: height / 4.5,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: new Stack(
            children: <Widget>[
              Container(
                width: width,
                height: height,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: new Carousel(
                    boxFit: BoxFit.cover,
                    images: [
                      AssetImage("icons/snickers.png"),
                      AssetImage("icons/snickers.png"),
                      AssetImage("icons/snickers.png"),
                    ],
                    autoplay: false,
                    dotSize: 3.5,
                    dotSpacing: 15,
                    dotBgColor: Colors.transparent,
                    indicatorBgPadding: 9.0,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(width * .06, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "RUN LONG",
                      style: TextStyle(
                        fontSize: 22 / textScaleFactor,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "RUN RIGHT",
                      style: TextStyle(
                        fontSize: 22 / textScaleFactor,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "RUN",
                      style: TextStyle(
                        fontSize: 22 / textScaleFactor,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
