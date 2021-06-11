import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuckingnum/providers/product_page-provider.dart';
import 'package:fuckingnum/providers/products_provider.dart';
import 'package:fuckingnum/screens/models/cart_constructor.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class BottomBar extends StatefulWidget {
  String productId;

  BottomBar(this.productId);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  void _addProductToCart() {
    var product = Provider.of<Products>(context, listen: false)
        .findById(widget.productId);
    var productColor = Provider.of<ProductPageProvider>(context, listen: false)
        .getProductColor(product.id);
    var productSize = Provider.of<ProductPageProvider>(context, listen: false)
        .getProductSize(product.id);
    Provider.of<Cart>(context, listen: false).addItem(
        product.image,
        product.id,
        product.price,
        product.oldPrice,
        product.title,
        productColor == null ? product.colors[0] : productColor,
        productSize == null ? product.sizes[0] : productSize,
        quantity: _counter);
  }

  int _counter = 1;

  double initVal = 5500000;
  double currentValue = 5500000;
  final formatter = NumberFormat('#,###,###');

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    final productId =
        ModalRoute.of(context).settings.arguments as String; // is the id!
    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productId);

    return BottomAppBar(
      color: Colors.transparent,
      elevation: 0.0,
      child: Container(
        padding: EdgeInsets.only(
            left: width * .01, top: height / 70, right: width * .02),
        height: height / 7,
        decoration: BoxDecoration(
          color: Color(0xFF0D3662),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(31),
            topRight: Radius.circular(31),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: height / 16,
              //width: width * .33,
              decoration: BoxDecoration(
                  color: Color(0xFFEBF1FD),
                  borderRadius: BorderRadius.circular(21)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.add,
                      color: Color(0xFF0D3662),
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        _counter++;
                        currentValue += initVal;
                      });
                    },
                  ),
                  Text(
                    '$_counter',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18 / textScaleFactor,
                      fontWeight: FontWeight.w300,
                      color: Color(0xFF0D3662),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.remove,
                      color: Color(0xFF0D3662),
                      size: 20,
                    ),
                    onPressed: () {
                      setState(
                        () {
                          if (_counter >= 1) {
                            _counter--;
                            if (currentValue != 0) {
                              currentValue -= initVal;
                            }
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(width: width * .04),
            RaisedButton(
              padding: EdgeInsets.fromLTRB(
                  width * .065, height * .02, width * .065, height * .02),
              color: Color(0xFFFF2D87),
              elevation: 0,
              onPressed: _addProductToCart,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(31),
              ),
              child: Row(
                children: <Widget>[
                  Text(
                    'В КОРЗИНУ',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15 / textScaleFactor,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: width * .04),
                  Container(
                    width: width * 0.25,
                    child: FittedBox(
                      child: Text(
                        loadedProduct.price.toString() + ' UZS',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12 / textScaleFactor,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
