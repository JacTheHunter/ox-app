import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SignUpStyle {

  static TextStyle getInputFieldsTextStyle(double scale) {
    return TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 16 / scale,
    );
  }

  static TextStyle getLabelsTextStyle(double scale) {
    return TextStyle(
      fontSize: 16 / scale,
      fontWeight: FontWeight.w500,
      fontFamily: 'Montserrat',
      color: HexColor("#627285"),
    );
  }


  static TextStyle getLabelsTextStyle2(double scale) {
    return TextStyle(
      fontSize: 16 / scale,
      fontWeight: FontWeight.w400,
      fontFamily: 'Montserrat',
      color: HexColor("#627285"),
    );
  }

  static TextStyle getButtonTextStyle(double scale) {
    return TextStyle(
      fontSize: 16 / scale,
      fontWeight: FontWeight.w500,
      fontFamily: 'Montserrat',
      color: Colors.white,
    );
  }

  static TextStyle getAppBarTextStyle(double scale) {
    return TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
      fontSize: 19.0 / scale,
      color: HexColor("#0D3662"),
    );
  }

  static InputDecoration getInputFieldsDecoration() {
    return InputDecoration(
      border: InputBorder.none,
    );
  }
}
