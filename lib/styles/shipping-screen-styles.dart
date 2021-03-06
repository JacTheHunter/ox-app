import 'package:flutter/cupertino.dart';
import 'package:hexcolor/hexcolor.dart';

class ShippingScreenStyles {
  static TextStyle getSelectShipmentTextStyle() {
    return TextStyle(
        fontFamily: 'Montserrat', fontSize: 14, color: HexColor('#0D3662'));
  }

  static TextStyle getServiceTypeTextStyle() {
    return TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: HexColor('#0D3662'));
  }

  static TextStyle getServiceTypeChargeTextStyle() {
    return TextStyle(
        fontFamily: 'Montserrat', fontSize: 14, color: HexColor('#627285'));
  }
}
