import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

class CartPage extends StatefulWidget {
  @override
  _CardState createState() => _CardState();
}

class _CardState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: height * .06),
            SvgPicture.asset("images/cart1.svg"),
            Text(
              "Ваша корзина пуста",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Hexcolor("#0D3662"),
                  fontFamily: 'Montserrat',
                  fontSize: 19 / textScaleFactor ),
            ),
            Text(
              "Откройте для себя что то новое,",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Hexcolor("#627285"),
                  fontFamily: 'Montserrat',
                  fontSize: 16 / textScaleFactor),
            ),
            Text(
              "чтобы обновить свой шкаф",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Hexcolor("#627285"),
                fontFamily: 'Montserrat',
                fontSize: 16 / textScaleFactor ,
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              height: height,
              width: width,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(31.0))),
                onPressed: () {},
                textColor: Colors.white,
                color: Colors.pink,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "В КАТАЛОГ ТОВАРОВ",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
