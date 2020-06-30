import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hexcolor/hexcolor.dart';

class Review2 extends StatelessWidget {
  final int value;

  const Review2({Key key, this.value = 5})
      : assert(value != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(20, 5, 5, 0),
            child: Container(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(2, 0, 5, 5),
                    child: Container(
                      width: 36,
                      height: 36,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.8),
                        child: Image.asset("icons/julia.jpg",
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Юля Александровна",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            fontFamily: 'Montserrat',
                            color: Hexcolor("#0D3662")),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(
                          5,
                              (index) {
                            return Icon(
                              index < value ? Icons.star : Icons.star_border,
                              size: 20,
                              color: Colors.yellow,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(75, 0, 0, 20),
                    child: Text(
                      "12.01.2020",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 13.5,
                        fontWeight: FontWeight.w400,
                        color: Hexcolor("#627285"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 174,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        RichText(
                          text: TextSpan(children: <TextSpan>[
                            TextSpan(
                              text: "Покупала в",
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Hexcolor("#828282"),
                              ),
                            ),
                            TextSpan(
                              text: " OX App",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                fontFamily: 'Montserrat',
                                color: Hexcolor("#0D3662"),
                              ),
                            ),
                          ]),
                        ),
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: "Вариация",
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Hexcolor("#828282"),
                                ),
                              ),
                              TextSpan(
                                text: " Белый, XS",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  fontFamily: 'Montserrat',
                                  color: Hexcolor("#0D3662"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Divider(
                      height: 10,
                      color: Hexcolor("#F4F4F4"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(13, 8, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          "Достоинства",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            fontFamily: 'Montserrat',
                            color: Hexcolor("#78D35B"),
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          "Смотрится добротно , тёплый , длинный (на рост 163 44 размер будет почти до щиколотки).",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Hexcolor("#0D3662"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(13, 28, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          "Недостатки",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            fontFamily: 'Montserrat',
                            color: Hexcolor("#EB5757"),
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          "Рукав коротковат , не критично , но для зимней одежды это как минимум странно .За это минус , но звёздочек вставлю пять.",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            fontFamily: 'Montserrat',
                            color: Hexcolor("#0D3662"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
