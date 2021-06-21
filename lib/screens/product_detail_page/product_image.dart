import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuckingnum/providers/products_provider.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class Product_Image extends StatefulWidget {
  @override
  _Product_Image createState() => _Product_Image();
}

class _Product_Image extends State<Product_Image>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController imagesController = TabController(length: 3, vsync: this);

    var width = MediaQuery
        .of(context)
        .size
        .width;
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var textScaleFactor = MediaQuery
        .of(context)
        .textScaleFactor;

    final productId =
    ModalRoute
        .of(context)
        .settings
        .arguments as String; // is the id!
    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productId);

    return Container(
      width: width,
      height: height / 1.4,
      child: Center(
        child: DefaultTabController(
          length: 3,
          child: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              TabBarView(
                controller: imagesController,
                children: <Widget>[
                  Image.asset(loadedProduct.image, fit: BoxFit.cover),
                  Image.asset(loadedProduct.image, fit: BoxFit.cover),
                  Image.asset(loadedProduct.image, fit: BoxFit.cover),
                ],
              ),
              Container(
                alignment: FractionalOffset(0.5, 0.97),
                child: TabPageSelector(
                  indicatorSize: 8,
                  controller: imagesController,
                  selectedColor: Colors.white,
                  color: Colors.white.withOpacity(0.5),
                ),
              ),
              Positioned(
                top: height * .70,
                left: width * .04,
                child: Row(
                  children: <Widget>[
                    Container(
                      padding:
                      EdgeInsets.only(left: width / 70, right: width / 70),
                      height: height / 38,
                      decoration: BoxDecoration(
                        color: HexColor("#FF1C1C"),
                        borderRadius: BorderRadius.circular(5.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 4,
                            blurRadius: 10,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "-50%",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0 / textScaleFactor,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Container(
                      padding:
                      EdgeInsets.only(left: width / 70, right: width / 70),
                      height: height / 38,
                      decoration: BoxDecoration(
                        color: HexColor("#78D35B"),
                        borderRadius: BorderRadius.circular(5.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 4,
                            blurRadius: 10,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "1+1=3",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0 / textScaleFactor,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Container(
                      padding:
                      EdgeInsets.only(left: width / 70, right: width / 70),
                      height: height / 38,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 4,
                            blurRadius: 10,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "10% CASHBACK",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0 / textScaleFactor,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700,
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
      ),
    );
  }
}
