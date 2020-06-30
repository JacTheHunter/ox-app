import 'package:flutter/cupertino.dart';
import 'package:hexcolor/hexcolor.dart';

class ShippingScreenStyles {
  static TextStyle getSelectShipmentTextStyle(double scale) {
    return TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 14 / scale,
        color: Hexcolor('#0D3662'));
  }

  static TextStyle getServiceTypeTextStyle(double scale) {
    return TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 14 / scale,
        fontWeight: FontWeight.w500,
        color: Hexcolor('#0D3662'));
  }

  static TextStyle getServiceTypeChargeTextStyle(double scale) {
    return TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 14 / scale,
        color: Hexcolor('#627285'));
  }
}
