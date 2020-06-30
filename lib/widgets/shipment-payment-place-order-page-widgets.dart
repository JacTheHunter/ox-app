import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ShippingPaymentPlaceOrderAppBar extends StatelessWidget {
  int activeIndex;

  ShippingPaymentPlaceOrderAppBar({@required this.activeIndex});

  Widget _getSelectedItem(String text, IconData icon, BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;
    return Container(
      width: width * .5,
      height: height * .07,
      decoration: BoxDecoration(
        color: Hexcolor('#FFEBF3'),
        borderRadius: BorderRadius.circular(35),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: Colors.pink,
          ),
          SizedBox(
            width: width * .02,
          ),
          Text(
            text,
            style: TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.pinkAccent,
              fontSize: 14 / textScaleFactor,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    if (activeIndex == 0) {
      return Container(
        width: width * .9,
        height: height * .09,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(35),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: width * .02,
            ),
            _getSelectedItem('Доставка', Icons.local_shipping, context),
            Container(
              width: width * .35,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(Icons.payment),
                  Icon(Icons.check_circle_outline)
                ],
              ),
            )
          ],
        ),
      );
    } else if (activeIndex == 1) {
      return Container(
        width: width * .9,
        height: height * .09,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(35),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              width: width * .0001,
            ),
            Icon(Icons.local_shipping),
            _getSelectedItem('Оплата', Icons.payment, context),
            Icon(Icons.check_circle_outline),
            SizedBox(
              width: width * .0001,
            ),
          ],
        ),
      );
    } else {
      return Container(
        width: width * .9,
        height: height * .09,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(35),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              width: width * .35,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(Icons.local_shipping),
                  Icon(Icons.payment)
                ],
              ),
            ),
            _getSelectedItem(
                'Подверждение', Icons.check_circle_outline, context),
            SizedBox(
              width: width * .02,
            ),
          ],
        ),
      );
    }
  }
}
