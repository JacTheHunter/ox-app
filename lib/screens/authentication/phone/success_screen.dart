import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuckingnum/screens/common/home.dart';

class SuccessScreen extends StatefulWidget {
  @override
  _SuccessScreen createState() => _SuccessScreen();
}

class _SuccessScreen extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    Timer(
      Duration(seconds: 1),
      () => Navigator.of(context).pushReplacement(
        CupertinoPageRoute(
          builder: (BuildContext context) => Home(),
        ),
      ),
    );

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF2F2F2),
        body: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: width / 2.8, top: height / 7),
                  child: Text(
                    'Привет!',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 28 / textScaleFactor,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF0D3662),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: width / 3.3, top: height / 4),
                  child: CircleAvatar(
                    radius: width / 5,
                    backgroundImage: AssetImage('icons/girl.png'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: width / 1.8, top: height / 2.7),
                  height: height / 8,
                  width: width / 6,
                  child: Image.asset('icons/success.png'),
                ),
                Container(
                  margin: EdgeInsets.only(top: height / 1.7),
                  child: Center(
                    child: Text(
                      'Совершай покупки с выгодой в \n 100 франчайзинговых брендов \n на территории Узбекистана.',
                      style: TextStyle(
                        height: height * .002,
                        fontFamily: 'Montserrat',
                        fontSize: 17 / textScaleFactor,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF627285),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
