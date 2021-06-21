import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class BalanceElement extends StatelessWidget {
  final String price;
  final String date;
  final String time;
  final String company;
  final String type;
  final String number;

  BalanceElement(
      this.price, this.date, this.time, this.company, this.type, this.number);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Container(
        width: width,
        height: height / 10,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(20, 5, 0, 7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    price,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: "Montserrat",
                      fontSize: 19,
                      color: HexColor("#78D35B"),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        date,
                        style: TextStyle(
                          fontSize: 11,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w400,
                          color: HexColor("#98A8C1"),
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        time,
                        style: TextStyle(
                          fontSize: 11,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w400,
                          color: HexColor("#98A8C1"),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    company,
                    style: TextStyle(
                      fontSize: 11,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w400,
                      color: HexColor("#98A8C1"),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 18, 13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "Заказ # $number",
                    style: TextStyle(
                      fontSize: 11,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w400,
                      color: HexColor("#98A8C1"),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    type,
                    style: TextStyle(
                      fontSize: 11,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w400,
                      color: HexColor("#98A8C1"),
                    ),
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
