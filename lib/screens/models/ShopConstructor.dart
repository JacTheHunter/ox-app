import 'package:flutter/cupertino.dart';

class ShopConstructor with ChangeNotifier {
  final String id;
  final String image;
  final String appBar;
  final String discount;
  final String cashback;

  ShopConstructor(
      {this.id, this.image, this.appBar, this.discount, this.cashback});

}
