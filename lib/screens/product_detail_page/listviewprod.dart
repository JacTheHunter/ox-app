import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Promotions_List extends StatefulWidget {
  @override
  _Promotions_List createState() => _Promotions_List();
}

class _Promotions_List extends State<Promotions_List> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.all(15),
      child: Container(
        height: height / 8,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
              width: 187,
              height: 95,
              decoration: BoxDecoration(
                border: Border.all(color: Hexcolor("#FFD3E6"), width: 1.2),
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(6, 13, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "1+1=3",
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Montserrat',
                            color: Hexcolor('#0D3662'),
                          ),
                        ),
                        Text(
                          "Купи два третий",
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Montserrat',
                            color: Hexcolor('#0D3662'),
                          ),
                        ),
                        Text(
                          "в подарок",
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Montserrat',
                            color: Hexcolor('#0D3662'),
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          "Подробнее об акции",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400,
                            fontSize: 12.0,
                            color: Hexcolor("#0D3662"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SvgPicture.asset(
                    "icons/present.svg",
                    height: height / 21,
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
            Container(
              width: 187,
              height: 95,
              decoration: BoxDecoration(
                border: Border.all(color: Hexcolor("#FFD3E6"), width: 1.2),
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "10% Cashback",
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Montserrat',
                            color: Hexcolor('#0D3662'),
                          ),
                        ),
                        Text(
                          "на кошелек",
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Montserrat',
                            color: Hexcolor('#0D3662'),
                          ),
                        ),
                        SizedBox(height: 25),
                        Text(
                          "Подробнее",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400,
                            fontSize: 12.0,
                            color: Hexcolor("#0D3662"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 30),
                  SvgPicture.asset(
                    "icons/money.svg",
                    height: height / 21,
                    color: Hexcolor("#0D3662"),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
            Container(
              width: width / 2,
              height: height / 4,
              decoration: BoxDecoration(
                border: Border.all(color: Hexcolor("#FFD3E6"), width: 1.2),
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Брендовая",
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Montserrat',
                            color: Hexcolor('#0D3662'),
                          ),
                        ),
                        Text(
                          "скидочная карта",
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Montserrat',
                            color: Hexcolor('#0D3662'),
                          ),
                        ),
                        Text(
                          "действует",
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Montserrat',
                            color: Hexcolor('#0D3662'),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Подробнее об акции",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400,
                            fontSize: 12.0,
                            color: Hexcolor("#0D3662"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SvgPicture.asset("icons/card.svg", height: height / 21),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
