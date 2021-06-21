import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fuckingnum/screens/common/home.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_verification_code_input/flutter_verification_code_input.dart';


import 'countdown_for_otp.dart';

class OTPScreen extends StatefulWidget {
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  bool wedVal = false;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 90));
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    TextStyle defaultStyle = TextStyle(
        color: HexColor("#627285"),
        fontSize: 16.0 / textScaleFactor,
        fontWeight: FontWeight.w400,
        fontFamily: 'Montserrat');

    TextStyle linkStyle = TextStyle(
        color: HexColor("#0D3662"),
        fontSize: 16.0 / textScaleFactor,
        fontWeight: FontWeight.w600,
        fontFamily: 'Montserrat');

    return Scaffold(
      backgroundColor: HexColor("#F7F8FB"),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: HexColor("#F7F8FB"),
        leading:  IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: HexColor("#0D3662"),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "Верификация",
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
            fontSize: 19.0 / textScaleFactor,
            color: HexColor("#0D3662"),
          ),
        ),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: ListView(
            children: <Widget>[
              SizedBox(height: height * .08),
              Center(
                child: Text(
                  "Введите 4-значный код который был \nотправлен на +998909969654",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    fontSize: 14.0 / textScaleFactor,
                    color: HexColor("#627285"),
                  ),
                ),
              ),
              SizedBox(height: height * .12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(width * .78, 0, 0, height * .015),
                    child: Container(
                      child: Countdown(
                        animation: StepTween(
                          begin: 1 * 90,
                          end: 0,
                        ).animate(_controller),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Код",
                        style: TextStyle(
                            fontSize: 16 / textScaleFactor,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Montserrat',
                            color: HexColor("#627285")),
                      ),
                      Text(
                        "Отправить ещё раз",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          fontSize: 14.0 / textScaleFactor,
                          color: HexColor("#965EFF"),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * .02),
                  VerificationCodeInput(
                    itemSize: height / 9,
                    keyboardType: TextInputType.number,
                    length: 4,
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 28 / textScaleFactor,
                      fontFamily: "Montserrat",
                      color: HexColor("#2D2D2D"),
                    ),
                    onCompleted: (String value) {
                      print(value);
                    },
                  ),
                ],
              ),
              SizedBox(height: height * .2),
              Row(
                children: <Widget>[
                  Checkbox(
                    activeColor: Colors.pink,
                    value: wedVal,
                    onChanged: (bool value) {
                      setState(
                            () {
                          wedVal = value;
                        },
                      );
                    },
                  ),
                  Text(
                    "Я ознакомился и принимаю условия \nпубличной оферты",
                    style: defaultStyle,
                  ),
                ],
              ),
              SizedBox(height: height * .03),
              Container(
                width: width,
                height: height * .08,
                child: RaisedButton(
                  elevation: 0,
                  child: Text(
                    'ГОТОВО',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      fontSize: 16 / textScaleFactor,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(31),
                  ),
                  padding: const EdgeInsets.all(15),
                  color: Colors.pink,
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                        context,
                        new CupertinoPageRoute(
                            builder: (context) => new Home()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
