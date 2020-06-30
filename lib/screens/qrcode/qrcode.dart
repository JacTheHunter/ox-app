import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Qr_Code extends StatefulWidget {
  @override
  _Qr_Code createState() => _Qr_Code();
}

class _Qr_Code extends State<Qr_Code> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF78D35B),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(right: width * .06, left: width* .06),
            child: Column(
              children: <Widget>[
                SizedBox(height: height / 18),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.keyboard_arrow_left,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: width / 3.7),
                    Text(
                      'Ваш код',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 19 / textScaleFactor,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'Действует во всех \n магазинах партнера OX',
                  style: TextStyle(
                    fontSize: 14 / textScaleFactor,
                    fontFamily: "Montserrat",
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 15),
                Container(
                  height: height / 1.51,
                  width: width / 1.25,
                  padding: EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Color(0xFFEBF1FD),
                  ),
                  child: Column(
                    children: <Widget>[
                      Text(
                        '832 093',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 36 / textScaleFactor,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(height: height * .02),
                      Container(
                        height: height / 2.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(23),
                          color: Colors.white,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('icons/qrcode.png'),
                          ),
                        ),
                      ),
                      SizedBox(height: 13),
                      Container(
                        height: height / 9,
                        width: width ,
                        margin: EdgeInsets.all(0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(23),
                          color: Colors.white,
                          image: DecorationImage(
                            image: AssetImage('icons/shtrix_code.png'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 46),
                Text(
                  'Покажите или скажите \n код кассиру',
                  style: TextStyle(
                    fontSize: 19 / textScaleFactor,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 14),
                Text(
                  'Получайте кэшбек, скидки и \n бонусы при предъявлении Вашего кода \n в брендовых магазинах которые \n используют систему OX',
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 14 / textScaleFactor,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: height * .05),
                Container(
                  height: height / 2,
                  child: Image.asset('icons/qrcodephoto.png'),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
