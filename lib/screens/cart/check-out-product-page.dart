import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:fuckingnum/screens/cart/check_out_product_item.dart';
import 'package:fuckingnum/utils/bottom-navigation-bar-utils.dart';
import 'package:fuckingnum/utils/ox-scrol-view.dart';
import 'package:provider/provider.dart';

import 'coupon_item.dart';
import '../summary_products.dart';
import '../models/cart_constructor.dart';

class CheckOutProductPage extends StatefulWidget {
  static const routeName = '/cart';

  @override
  _CheckOutProductPageState createState() => _CheckOutProductPageState();
}

class _CheckOutProductPageState extends State<CheckOutProductPage> {
  bool isKeyboardVisible = false;

  ScaffoldWithBottomNavigation oldState;

  void _closeCheckOutProductPage() {
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();
    KeyboardVisibility.onChange.listen((bool visible) {
      if (mounted) {
        this.isKeyboardVisible = visible;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    final cart = Provider.of<Cart>(context);

    if (this.isKeyboardVisible) {
      return oldState;
    }

    var scaffoldWithBottomNavigation = ScaffoldWithBottomNavigation();
    var oxScrollView = OxScrollView(
        ScrollController(),
        Container(
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: width,
                height: height * .14,
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: width * .03,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Colors.black54,
                        size: 30,
                      ),
                      onPressed: () {
                        this._closeCheckOutProductPage();
                      },
                    ),
                  ],
                ),
              ),
              Container(
                width: width,
                margin: EdgeInsets.only(left: width * .05, right: width * .05),
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: cart.items.length,
                  itemBuilder: (ctx, i) => Container(
                    margin: EdgeInsets.only(bottom: height * .02),
                    child: CheckoutProductItem(cart.items.values.toList()[i]),
                  ),
                ),
              ),
              SizedBox(
                height: height * .03,
              ),
              Container(
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    IHaveCouponItem(),
                  ],
                ),
              ),
              SizedBox(
                height: height * .03,
              ),
              SummaryProducts()
            ],
          ),
        ),
        GlobalKey());
    scaffoldWithBottomNavigation.body = oxScrollView;
    oldState = scaffoldWithBottomNavigation;
    return scaffoldWithBottomNavigation;
  }
}
