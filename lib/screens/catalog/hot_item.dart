import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    return Column(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: 106,
            height: 106,
            child: GridTile(
              child: Image.asset(image, fit: BoxFit.cover),
              footer: GridTileBar(
                trailing: Padding(
                  padding: EdgeInsets.fromLTRB(width * .09, height * .025 , 0, height * .001 ),
                  child: Container(
                    width: 33,
                    height: 16,
                    decoration: BoxDecoration(
                        color: Hexcolor("#FF1C1C"),
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Center(
                      child: Text(
                        discount,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11.0 / textScaleFactor,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
          child: Text(
            price,
            style: TextStyle(
                fontSize: 12 / textScaleFactor,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
                color: Hexcolor("#0D3662")),
          ),
        ),
        Text(
          oldprice,
          style: TextStyle(
            decoration: TextDecoration.lineThrough,
            decorationColor: Colors.red,
            decorationThickness: 3.0,
            fontWeight: FontWeight.w400,
            fontFamily: 'Montserrat',
            fontSize: 8 / textScaleFactor,
            color: Hexcolor('#0D3662'),
          ),
        ),
      ],
    );
  }
}
