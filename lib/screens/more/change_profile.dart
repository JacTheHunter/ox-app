import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuckingnum/screens/authentication/phone/otp_screen.dart';
import 'package:fuckingnum/styles/sign-up-style.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../constants.dart';

class ChangeProfile extends StatefulWidget {
  @override
  _ChangeProfile createState() => _ChangeProfile();
}

class _ChangeProfile extends State<ChangeProfile> {
  @override
  Widget build(BuildContext context) {
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    final logo = CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 48.0,
      child: Image.asset('icons/profile.png'),
    );
    final name = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("ФИО", style: SignUpStyle.getLabelsTextStyle(textScaleFactor)),
        SizedBox(height: height * .02),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: height / 14,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: SignUpStyle.getInputFieldsTextStyle(textScaleFactor),
            textAlign: TextAlign.center,
            decoration: SignUpStyle.getInputFieldsDecoration(),
          ),
        ),
      ],
    );

    final phone_number = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Номер телефона",
            style: SignUpStyle.getLabelsTextStyle(textScaleFactor)),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: height / 14,
          child: TextField(
            keyboardType: TextInputType.phone,
            textAlign: TextAlign.center,
            style: SignUpStyle.getInputFieldsTextStyle(textScaleFactor),
            decoration: SignUpStyle.getInputFieldsDecoration(),
          ),
        ),
      ],
    );

    final email = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Email", style: SignUpStyle.getLabelsTextStyle(textScaleFactor)),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: height / 14,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: SignUpStyle.getInputFieldsTextStyle(textScaleFactor),
            textAlign: TextAlign.center,
            decoration: SignUpStyle.getInputFieldsDecoration(),
          ),
        ),
      ],
    );

    final button = Container(
      width: 327,
      height: 62,
      child: RaisedButton(
        elevation: 0.0,
        child: Text(
          'СОХРАНИТЬ',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500,
            fontSize: 16,
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
            new CupertinoPageRoute(builder: (context) => new OTPScreen()),
          );
        },
      ),
    );
    return Scaffold(
      backgroundColor: Hexcolor("#F7F8FB"),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Hexcolor("#F7F8FB"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Hexcolor("#0D3662"),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "Изменить данные",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 19,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
            color: Hexcolor("#0D3662"),
          ),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Center(
            child: ListView(
              children: <Widget>[
                logo,
                SizedBox(height: 10),
                name,
                SizedBox(height: 10),
                phone_number,
                SizedBox(height: 10),
                email,
                SizedBox(height: 50),
                button
              ],
            ),
          ),
        ),
      ),
    );
  }
}
