import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';

class details_buyel extends StatefulWidget {
  final int price;
  final int quantity;
  final String title;
  final String image;

  details_buyel(this.price, this.quantity, this.title, this.image);

  @override
  _details_buyel createState() => _details_buyel();
}

class _details_buyel extends State<details_buyel> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;
    return Padding(
      padding: EdgeInsets.only(bottom: height * .03),
      child: Container(
        width: 327,
        height: 173,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(23.0),
        ),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16),
              child: Container(
                width: 71,
                height: 140,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset(widget.image, fit: BoxFit.cover),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      color: HexColor("#0D3662"),
                    ),
                  ),
                  Text(
                    'ZF876',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                      color: HexColor("#627285"),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'Color',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Montserrat',
                          fontSize: 14,
                          color: HexColor("#0D3662"),
                        ),
                      ),
                      SizedBox(width: 5),
                      SvgPicture.asset('icons/oval.svg'),
                      SizedBox(width: 10),
                      Text(
                        'XL',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Montserrat',
                          fontSize: 14,
                          color: HexColor("#0D3662"),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        widget.quantity.toString() + ' x ',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400,
                          color: HexColor("#0D3662"),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        widget.price.toString() + ' UZS',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          color: HexColor("#0D3662"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
