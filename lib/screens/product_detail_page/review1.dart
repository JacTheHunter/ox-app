import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Review1 extends StatefulWidget {
  @override
  _Review1State createState() => _Review1State();
}

class _Review1State extends State<Review1> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 0),
          child: Container(
            width: width,
            height: height/9,
            decoration: BoxDecoration(
              color: Hexcolor("#EBF1FD"),
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
            child: Padding(
              padding: EdgeInsets.all(17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "Вы не можете оставить отзыв",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      fontFamily: 'Montserrat',
                      color: Hexcolor("#0D3662"),
                    ),
                  ),
                  Text(
                    "Мы не нашли данный товар среди ваших покупок.Вы можете оставить отзыв к товарам которые приобретали ранее",
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
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: Container(
            width:MediaQuery.of(context).size.width/3,
            height: 38,
            decoration: BoxDecoration(
              color: Hexcolor("#EBF1FD"),
              borderRadius: BorderRadius.all(
                Radius.circular(25.0),
              ),
            ),
            child: Center(
              child: Text(
                "Оставить отзыв",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Hexcolor("#B7C1D2"),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
