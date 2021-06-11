import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuckingnum/utils/number-utils.dart';
import 'package:hexcolor/hexcolor.dart';

class Hot_Item extends StatelessWidget {
  final String image;
  final String price;
  final String oldprice;
  final String discount;

  Hot_Item(this.image, this.discount, this.price, this.oldprice);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;
    return Container(
      height: height * .23,
      width: width * .3,
      margin: EdgeInsets.only(left: width * .02),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: height * .165,
              width: width * .3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover)),
            ),
          ),
          Align(
            alignment: Alignment(.8, .3),
            child: Container(
              height: height * .021,
              width: width * .09,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: Colors.red),
              child: Center(
                child: Text(
                  this.discount,
                  //textScaleFactor: 1,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, .7),
            child: Container(
              height: height * .04,
              width: width * .3,
              child: Center(
                child: Text(
                  this.price,
                  textScaleFactor: 1,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Hexcolor('#0D3662')),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, .9),
            child: Container(
              height: height * .04,
              width: width * .3,
              child: Center(
                child: Text(
                  oldprice,
                  textScaleFactor: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Montserrat',
                    fontSize: 8 / textScaleFactor,
                    decoration: TextDecoration.lineThrough,
                    decorationThickness: 2,
                    decorationColor: Hexcolor('#F92121'),
                    color: Hexcolor('#0D3662'),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
