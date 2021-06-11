import 'dart:ui';
import 'dart:math';
import 'package:barcode_flutter/barcode_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Qr_Code extends StatefulWidget {
  @override
  _Qr_Code createState() => _Qr_Code();
}

class _Qr_Code extends State<Qr_Code> {
  int qrData = 832093;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Ваш код',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 19 / textScaleFactor,
                color: Colors.white,
                fontWeight: FontWeight.w600),
          ),
        ),
        backgroundColor: Color(0xFF78D35B),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: height * .01),
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
                        qrData.toString(),
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 36 / textScaleFactor,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(height: height * .02),
                      Container(
                        alignment: Alignment.center,
                        height: height / 2.5,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              qrData = Random().nextInt(1000000);
                            });
                          },
                          child: QrImage(
                            data: qrData.toString(),
                            version: QrVersions.auto,
                            size: 320 / textScaleFactor,
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(23),
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 13),
                      Container(
                        height: height / 9,
                        width: width,
                        padding: EdgeInsets.only(left: width * .03 , top: height * .02 , bottom: height * .02 , right:  width * .06),
                            //vertical: height * .02, horizontal: width * .04),
                        margin: EdgeInsets.all(0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(23),
                          color: Colors.white,
                        ),
                        child: BarCodeImage(
                          params: Code93BarCodeParams(
                            qrData.toString(),
                            lineWidth: 2.75,
                            //barHeight: height *  .08
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
