import 'package:flutter/widgets.dart';

class MyBuys_Constructor extends ChangeNotifier {
  final String id;
  final String numberOrder;
  final String month;
  final String date;
  final String shop;
  final int count;
  final String price;
  final String state;
  bool colorState;

  MyBuys_Constructor(
      {this.id,
      this.numberOrder,
      this.month,
      this.date,
      this.shop,
      this.count,
      this.price,
      this.state,
      this.colorState = false});
}
