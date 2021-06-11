import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuckingnum/screens/cart/product_delivery.dart';
import 'package:fuckingnum/screens/models/cart_constructor.dart' show Cart;
import 'package:fuckingnum/styles/check-ou-product-styles.dart';
import 'package:fuckingnum/widgets/RedButtonWidget.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'cart/shipping-products-page-widget.dart';

class SummaryProducts extends StatefulWidget {
  static const routeName = '/cart';

  @override
  _SummaryProductsState createState() => _SummaryProductsState();
}

class _SummaryProductsState extends State<SummaryProducts> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    final cart = Provider.of<Cart>(context);

    return Container(
      width: width,
      height: height * .5,
      padding: EdgeInsets.only(
        left: width * .05,
        right: width * .05,
        top: height * .02,
      ),
      decoration: BoxDecoration(
          color: Hexcolor('#0D3662'),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Column(
        children: <Widget>[
          Container(
            width: width / 12,
            height: 6,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.5),
                color: Hexcolor("#8A96AD")),
          ),
          SizedBox(
            height: height * .05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Подитог',
                style: CheckOutProductPageStyles.getSummaryTextStyles(
                    textScaleFactor),
              ),
              Text(
                cart.totalAmount.toString() + ' UZS',
                style: CheckOutProductPageStyles.getSummaryTextStyles(
                    textScaleFactor),
              ),
            ],
          ),
          SizedBox(
            height: height * .03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Доставка',
                style: CheckOutProductPageStyles.getSummaryTextStyles(
                    textScaleFactor),
              ),
              Text(
                '0 UZS',
                style: CheckOutProductPageStyles.getSummaryTextStyles(
                    textScaleFactor),
              ),
            ],
          ),
          SizedBox(
            height: height * .05,
          ),
          Container(
            child: CustomPaint(painter: LineDashedPainter()),
          ),
          SizedBox(
            height: height * .06,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Итого',
                style: CheckOutProductPageStyles.getSummaryTextStyles(
                    textScaleFactor),
              ),
              Text(
                cart.totalAmount.toString() + ' UZS',
                style: CheckOutProductPageStyles.getFinalSummaryTextStyles(
                    textScaleFactor),
              ),
            ],
          ),
          SizedBox(
            height: height * .06,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => Scaffold(
                      body: ProductDeliveryPage(),
                    ),
                  ));
            },
            child: PinkButton('ОФОРМИТЬ ЗАКАЗ'),
          )
        ],
      ),
    );
  }
}

class LineDashedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var max = 370;
    var dashWidth = 10;
    var dashSpace = 10;
    double startX = -183;
    final paint = Paint()..color = Hexcolor("#D8D8D8");
    while (max >= 0) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0),
          paint..strokeWidth = 1.5);
      final space = (dashSpace + dashWidth);
      startX += space;
      max -= space;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
