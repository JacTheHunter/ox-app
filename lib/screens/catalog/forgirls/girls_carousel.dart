import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class Girls_Carousel extends StatefulWidget {
  @override
  _Girls_Carousel createState() => _Girls_Carousel();
}

class _Girls_Carousel extends State<Girls_Carousel> {
  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Padding(
      padding: EdgeInsets.fromLTRB(width * .025, 0, width * .025, 0),
      child: Container(
        width: width,
        height: height / 4.8,
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
                      AssetImage("icons/carosuel1.jpg"),
                      AssetImage("icons/carosuel1.jpg"),
                      AssetImage("icons/carosuel1.jpg"),
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
                padding: EdgeInsets.fromLTRB(0, height * 0.1, 0, 0),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Text(
                        "ЛИКВИДАЦИЯ!",
                        style: TextStyle(
                          fontSize: 16/ textScaleFactor,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: height * .01),
                      Text(
                        "Распродажа коллекции",
                        style: TextStyle(
                          fontSize: 14 / textScaleFactor,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Прошлого сезона",
                        style: TextStyle(
                          fontSize: 14 / textScaleFactor,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
