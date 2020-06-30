import 'package:flutter/cupertino.dart';
import 'package:hexcolor/hexcolor.dart';

class BasketPageStyles {
  static TextStyle getBasketPageWelcomeText1Style(double scale) {
    return TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600,
        fontSize: 19 / scale,
        color: Hexcolor('#0D3662'));
  }

  static TextStyle getBasketPageWelcomeText2Style(double scale) {
    return TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.normal,
        fontSize: 16 / scale,
        color: Hexcolor('#627285'));
  }
}
