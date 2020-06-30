import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuckingnum/transitions/rightslide.dart';
import 'package:hexcolor/hexcolor.dart';

import 'details_buy.dart';

class myBuys_el extends StatefulWidget {
  @override
  _myBuys_el createState() => _myBuys_el();
}

class _myBuys_el extends State<myBuys_el> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.push(context, SlideRightRoute(page: detailsBuy()));
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              padding: EdgeInsets.all(10),
              width: 327.0,
              height: 281.0,
              decoration: BoxDecoration(
                color: Hexcolor("#EBF1FD"),
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(8,0,8,0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(8, 7, 8, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Заказ #346444',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 19,
                              fontWeight: FontWeight.w600,
                              color: Hexcolor("#0D3662"),
                            ),
                          ),
                          Text(
                            'Май 04, 2020',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Hexcolor("#627285"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 295,
                      height: 145,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(23),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(17, 0, 17, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    SvgPicture.asset(
                                      'icons/store.svg',
                                      height: 20,
                                      color: Hexcolor('#0D3662'),
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      "OX App",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w500,
                                        color: Hexcolor("#0D3662"),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "2 шт.",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w400,
                                    color: Hexcolor("#627285"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 0,
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(left: 20, right: 20),
                            child: Divider(height: 0, color: Colors.black),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 17, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  width: 64,
                                  height: 16,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: Hexcolor("#78D35B"),
                                  ),
                                  child: Text(
                                    'cashback',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Montserrat',
                                      fontSize: 11,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 6),
                                Text(
                                  '+ 78 000 UZS',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w400,
                                    color: Hexcolor("#78D35B"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 17, 0),
                            child: Text(
                              '2 940 000 UZS',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Montserrat',
                                fontSize: 16,
                                color: Hexcolor('#0D3662'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: 108,
                            height: 32,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Hexcolor("#FECE2F"),
                            ),
                            child: Center(
                              child: Text(
                                'В процессе',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Montserrat',
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          FlatButton(
                            onPressed: () {},
                            child: Text(
                              'Подробнее +',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500,
                                color: Hexcolor("#0D3662"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
