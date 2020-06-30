import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CheckOutProductPageStyles {
  static TextStyle getIHaveCouponButtonText(double scale) {
    return TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w500,
      fontSize: 14 / scale,
      color: Hexcolor('#0D3662'),
    );
  }

  static TextStyle getSummaryTextStyles(double scale) {
    return TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w500,
      fontSize: 16 / scale,
      color: Colors.white,
    );
  }

  static TextStyle getFinalSummaryTextStyles(double scale) {
    return TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
      fontSize: 19 / scale,
      color: Colors.white,
    );
  }

  static InputDecoration getCouponTextInputDecoration(double scale) {
    return InputDecoration(
      hintText: 'Ввести код купона',
      hintStyle: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w500,
          fontSize: 14 / scale,
          color: Hexcolor('#B7C1D2')),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.transparent,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.transparent,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.transparent,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.transparent,
        ),
      ),
    );
  }
}
