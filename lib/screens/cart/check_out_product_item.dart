import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuckingnum/screens/models/cart_constructor.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import '../models/cart_constructor.dart';

class CheckoutProductItem extends StatefulWidget {
  final CartItem cartItem;

  CheckoutProductItem(this.cartItem);

  static double widgetHeight = .23;

  @override
  _CheckoutProductItem createState() => _CheckoutProductItem();
}

class _CheckoutProductItem extends State<CheckoutProductItem> {
  bool _hasDiscountPrice;

  @override
  void initState() {
    super.initState();
    _hasDiscountPrice = widget.cartItem.oldPrice != null;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Dismissible(
      key: ValueKey(widget.cartItem.id),
      direction: DismissDirection.endToStart,
      background: Container(
        padding: EdgeInsets.only(right: width * .03),
        alignment: Alignment.centerRight,
        color: Colors.red,
        child: Icon(
          Icons.delete,
          size: 60 / textScaleFactor,
          color: Colors.white,
        ),
      ),
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false)
            .removeItem(widget.cartItem.productId);
      },
      child: Container(
        width: width * .9,
        height: height * .23,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: width * .05,
            ),
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  widget.cartItem.image,
                  width: width * .2,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: width * .04,
            ),
            Container(
              width: width * .42,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.cartItem.title,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      fontSize: 16 / textScaleFactor,
                      color: Hexcolor('#0D3662'),
                    ),
                  ),
                  Text(
                    'ZF876',
                    style: TextStyle(
                        color: Hexcolor('#627285'),
                        fontSize: 14 / textScaleFactor,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Montserrat'),
                  ),
                  SizedBox(
                    height: height * .01,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'Color',
                        style: TextStyle(
                          color: Hexcolor('#0D3662'),
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          fontSize: 14 / textScaleFactor,
                        ),
                      ),
                      SizedBox(
                        width: width * .01,
                      ),
                      Container(
                        width: width * .03,
                        height: width * .03,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(width * .03),
                            color: Hexcolor(widget.cartItem.color)),
                      ),
                      SizedBox(
                        width: width * .03,
                      ),
                      Text(
                        widget.cartItem.size,
                        style: TextStyle(
                          color: Hexcolor('#0D3662'),
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          fontSize: 14 / textScaleFactor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * .03,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.cartItem.quantity.toString() + ' x ',
                        style: TextStyle(
                          color: Hexcolor('#0D3662'),
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400,
                          fontSize: 14 / textScaleFactor,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.cartItem.price.toString() + ' UZS',
                            style: TextStyle(
                              color: this._hasDiscountPrice
                                  ? Colors.pinkAccent
                                  : Hexcolor('#0D3662'),
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                              fontSize: 16 / textScaleFactor,
                            ),
                          ),
                          this._hasDiscountPrice
                              ? Text(
                            widget.cartItem.oldPrice.toString() + ' UZS',
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              decorationThickness: 1,
                              decorationColor: Hexcolor('#627285'),
                              color: Hexcolor('#627285'),
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                              fontSize: 12 / textScaleFactor,
                            ),
                          )
                              : SizedBox.shrink()
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: width * .11,
              height: height * .1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Hexcolor('#EBF1FD'),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: width * .13,
                    height: height * .05,
                    child: IconButton(
                      icon: Icon(
                        Icons.add,
                        size: 20,
                      ),
                      onPressed: () {
                        Provider.of<Cart>(context, listen: false)
                            .increaseQuantity(widget.cartItem.productId);
                      },
                    ),
                  ),
                  Container(
                    width: width * .13,
                    height: height * .05,
                    child: IconButton(
                      icon: Icon(
                        Icons.remove,
                        size: 20,
                      ),
                      onPressed: () {
                        Provider.of<Cart>(context, listen: false)
                            .decreaseQuantity(widget.cartItem.productId);
                      },
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
