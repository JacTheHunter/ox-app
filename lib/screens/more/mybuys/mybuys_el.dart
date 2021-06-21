import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuckingnum/screens/models/my_buys_cosntructor.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import '../../models/screen_arguments.dart';
import 'details_buy.dart';

class myBuys_el extends StatefulWidget {
  @override
  _myBuys_el createState() => _myBuys_el();
}

class _myBuys_el extends State<myBuys_el> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    final product = Provider.of<MyBuys_Constructor>(context, listen: false);

    return Padding(
      padding: EdgeInsets.fromLTRB(width * .02, 0, width * .02, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            padding: EdgeInsets.all(10),
            width: width,
            height: height * .34,
            decoration: BoxDecoration(
              color: HexColor("#EBF1FD"),
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(detailsBuy.routeName,
                    arguments: ScreenArguments(product.id));
              },
              child: Padding(
                padding: EdgeInsets.fromLTRB(width * .02, 0, width * .02, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          width * .02, height * .01, width * .02, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Заказ #' + product.numberOrder,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 19 / textScaleFactor,
                              fontWeight: FontWeight.w600,
                              color: HexColor("#0D3662"),
                            ),
                          ),
                          Text(
                            product.month + product.date,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 14 / textScaleFactor,
                              fontWeight: FontWeight.w400,
                              color: HexColor("#627285"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: width,
                      height: height * .17,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(23),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                width * .05, 0, width * .05, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    SvgPicture.asset(
                                      'icons/store.svg',
                                      height: height * .025,
                                      color: HexColor('#0D3662'),
                                    ),
                                    SizedBox(width: width * .01),
                                    Text(
                                      product.shop,
                                      style: TextStyle(
                                        fontSize: 16 / textScaleFactor,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w500,
                                        color: HexColor("#0D3662"),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  product.count.toString() + ' шт.',
                                  style: TextStyle(
                                    fontSize: 14 / textScaleFactor,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w400,
                                    color: HexColor("#627285"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 0,
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(
                                left: width * .01, right: width * .01),
                            child:
                            Divider(height: 0, color: HexColor("#F2F2F2")),
                          ),
                          //Padding(
                          //  padding: EdgeInsets.fromLTRB(0, 0, 17, 0),
                          //  child: Row(
                          //    mainAxisAlignment: MainAxisAlignment.end,
                          //    children: <Widget>[
                          //      Container(
                          //        width: 64,
                          //        height: 16,
                          //        decoration: BoxDecoration(
                          //          borderRadius: BorderRadius.circular(16),
                          //          color: HexColor("#78D35B"),
                          //        ),
                          //        child: Text(
                          //          product.state,
                          //          textAlign: TextAlign.center,
                          //          style: TextStyle(
                          //            fontWeight: FontWeight.w500,
                          //            fontFamily: 'Montserrat',
                          //            fontSize: 11,
                          //            color: Colors.white,
                          //          ),
                          //        ),
                          //      ),
                          //      SizedBox(width: 6),
                          //    ],
                          //  ),
                          //),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, width * .045, 0),
                            child: Text(
                              product.price + ' UZS',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Montserrat',
                                fontSize: 16 / textScaleFactor,
                                color: HexColor('#0D3662'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(width * .01, 0, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: width * .3,
                            height: height * .04,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: product.colorState
                                    ? HexColor("#FECE2F")
                                    : HexColor("#78D35B")),
                            child: Center(
                              child: Text(
                                product.state,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Montserrat',
                                  fontSize: 14 / textScaleFactor,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          FlatButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed(
                                  detailsBuy.routeName,
                                  arguments: ScreenArguments(product.id));
                            },
                            child: Text(
                              'Подробнее +',
                              style: TextStyle(
                                fontSize: 14 / textScaleFactor,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500,
                                color: HexColor("#0D3662"),
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
