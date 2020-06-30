import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';

class GridFor_FeedItem extends StatelessWidget {
  final String image;
  final String brand;
  final String discount;
  final String cashback;

  GridFor_FeedItem(this.image, this.brand, this.discount, this.cashback);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Container(
      width: width,
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Container(
              color: Colors.white,
              child: Image.asset(image ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(width * .03, height * .025, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  brand,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: "Montserrat",
                      fontSize: 14,
                      color: Hexcolor('#0D3662')),
                ),
                Text(
                  discount,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: "Montserrat",
                    fontSize: 14,
                    color: Hexcolor('#0D3662'),
                  ),
                ),
                Text(
                  cashback,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: "Montserrat",
                    fontSize: 14,
                    color: Hexcolor('#0D3662'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
