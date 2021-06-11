/*
this widget wraps 2 widget empty card page(No products added to basket)
and check out page (more than 0 added products to basket)
 */

import 'package:flutter/material.dart';
import 'package:fuckingnum/screens/cart/check-out-product-page.dart';
import 'package:fuckingnum/screens/cart/empty-cart-page.dart';
import 'package:fuckingnum/screens/models/cart_constructor.dart';
import 'package:provider/provider.dart';

class CartWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var items = Provider.of<Cart>(context, listen: false).items;

    if (items.isEmpty) {
      return BasketPage(); //empty cart page
    } else {
      return CheckOutProductPage();
    }
  }
}
