import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuckingnum/providers/my_buys_provider.dart';
import 'package:fuckingnum/screens/models/cart_constructor.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'detailsbuy_el.dart';

class detailsBuy extends StatefulWidget {
  static const routeName = '/detailsBuy';
  final String id;
  detailsBuy(this.id);

  @override
  _detailsBuy createState() => _detailsBuy();
}

class _detailsBuy extends State<detailsBuy> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    final loadedProduct = Provider.of<MyBuys_Provider>(
      context,
      listen: false,
    ).findById(widget.id);

    final cart = Provider.of<Cart>(context);

    return Scaffold(
      backgroundColor: HexColor("#F7F8FB"),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: HexColor("#F7F8FB"),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: HexColor("#0D3662"),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        title: Text(
          'Детали заказа',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: 'Montserrat',
            fontSize: 19,
            color: HexColor('#0D3662'),
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  width: 327,
                  height: 85,
                  decoration: BoxDecoration(
                    color: HexColor("#EBF1FD"),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(19, 0, 19, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                SvgPicture.asset(
                                  'icons/store.svg',
                                  height: 20,
                                  color: HexColor('#0D3662'),
                                ),
                                SizedBox(width: 3),
                                Text(
                                  loadedProduct.shop,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    color: HexColor("#0D3662"),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              loadedProduct.month + loadedProduct.date,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Montserrat',
                                fontSize: 14,
                                color: HexColor("#627285"),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(19, 0, 19, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                SvgPicture.asset('icons/truck.svg'),
                                SizedBox(width: 3),
                                Text(
                                  'Быстрая доставка',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w500,
                                    color: HexColor("#0D3662"),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '14:00',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Montserrat',
                                fontSize: 14,
                                color: HexColor("#627285"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: FlatButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Где сейчас мой заказ?",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            color: HexColor("#0D3662"),
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: width,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: cart.items.length,
                    itemBuilder: (ctx, i) => details_buyel(
                      cart.items.values.toList()[i].price,
                      cart.items.values.toList()[i].quantity,
                      cart.items.values.toList()[i].title,
                      cart.items.values.toList()[i].image,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
                  child: Container(
                    width: 327,
                    height: 489,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: HexColor("#EBF1FD"),
                    ),
                    child: LayoutBuilder(
                      builder: (conxtext, constraints) => Padding(
                        padding: EdgeInsets.fromLTRB(24, 24, 24, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Заказ #' + loadedProduct.numberOrder,
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600,
                                    color: HexColor("#0D3662"),
                                  ),
                                ),
                                Text(
                                  loadedProduct.month + loadedProduct.date,
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: HexColor("#627285"),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 28),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Cashback',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: HexColor("#0D3662"),
                                  ),
                                ),
                                Text(
                                  '+78 000 UZS',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: HexColor("#0D3662"),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Подитог',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: HexColor("#0D3662"),
                                  ),
                                ),
                                Text(
                                  loadedProduct.price,
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: HexColor("#0D3662"),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Доставка',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: HexColor("#0D3662"),
                                  ),
                                ),
                                Text(
                                  '35 000 UZS',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: HexColor("#0D3662"),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Container(
                              child: CustomPaint(
                                painter: LineDashedPainter(),
                                size: Size(constraints.maxWidth, 5),
                              ),
                            ),
                            SizedBox(height: 20.5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Итого',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: HexColor("#0D3662"),
                                  ),
                                ),
                                Text(
                                  '2 940 000 UZS',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600,
                                    color: HexColor("#0D3662"),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: 149,
                              height: 67,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        SvgPicture.asset('icons/wallet.svg'),
                                        SizedBox(width: 8),
                                        Text(
                                          loadedProduct.price + ' UZS',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Montserrat',
                                            fontSize: 13,
                                            color: HexColor("#0D3662"),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        SvgPicture.asset('icons/wallet.svg'),
                                        SizedBox(width: 8),
                                        Text(
                                          '40 000 UZS',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Montserrat',
                                            fontSize: 13,
                                            color: HexColor("#0D3662"),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 34, 0, 30),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Container(
                                    width: 37,
                                    height: 52,
                                    decoration: BoxDecoration(
                                      color: HexColor("#965EFF"),
                                      borderRadius: BorderRadius.circular(11),
                                    ),
                                    child: SvgPicture.asset(
                                      'icons/money11.svg',
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                  Icon(Icons.arrow_forward_ios),
                                  Container(
                                    width: 37,
                                    height: 52,
                                    decoration: BoxDecoration(
                                      color: HexColor("#965EFF"),
                                      borderRadius: BorderRadius.circular(11),
                                    ),
                                    child: SvgPicture.asset('icons/file.svg',
                                        fit: BoxFit.scaleDown),
                                  ),
                                  Icon(Icons.arrow_forward_ios),
                                  Container(
                                    width: 37,
                                    height: 52,
                                    decoration: BoxDecoration(
                                      color: HexColor("#ECE1FE"),
                                      borderRadius: BorderRadius.circular(11),
                                    ),
                                    child: SvgPicture.asset(
                                      'icons/truck.svg',
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                  Icon(Icons.arrow_forward_ios),
                                  Container(
                                    width: 37,
                                    height: 52,
                                    decoration: BoxDecoration(
                                      color: HexColor("#ECE1FE"),
                                      borderRadius: BorderRadius.circular(11),
                                    ),
                                    child: SvgPicture.asset(
                                      'icons/done.svg',
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                Text(
                                  "Отследите свой заказ в режиме реального времени",
                                  style: TextStyle(
                                    fontSize: 14 / textScaleFactor,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w500,
                                    color: HexColor("#0D3662"),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      0, 0, width * .2, height * .01),
                                  child: Container(
                                    width: width * .65,
                                    height: 10,
                                    color: HexColor("#965EFF").withOpacity(0.2),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      0, 30, width * .40, 0),
                                  child: Container(
                                    width: width * .35,
                                    height: 10,
                                    color: HexColor("#965EFF").withOpacity(0.2),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LineDashedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var max = size.width;
    var dashWidth = 10;
    var dashSpace = 10;
    double startX = 1;
    final paint = Paint()..color = HexColor("#0D3662");
    while (max >= size.width * .01) {
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
