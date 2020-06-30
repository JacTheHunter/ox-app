import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Product_Image extends StatefulWidget {
  @override
  _Product_Image createState() => _Product_Image();
}

class _Product_Image extends State<Product_Image>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController imagesController = TabController(length: 3, vsync: this);

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

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
                  Image.asset("icons/product_detail.jpg", fit: BoxFit.cover),
                  Image.asset("icons/product_detail.jpg", fit: BoxFit.cover),
                  Image.asset("icons/product_detail.jpg", fit: BoxFit.cover),
                ],
              ),
              Container(
                alignment: FractionalOffset(0.5, 0.90),
                child: TabPageSelector(
                  controller: imagesController,
                  selectedColor: Colors.grey,
                  color: Colors.white,
                ),
              ),
              Positioned(
                top: height * .70,
                left: width * .04,
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 48,
                      height: 23,
                      decoration: BoxDecoration(
                          color: Hexcolor("#FF1C1C"),
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Center(
                        child: Text(
                          "-50%",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Container(
                      width: 52,
                      height: 23,
                      decoration: BoxDecoration(
                          color: Hexcolor("#78D35B"),
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Center(
                        child: Text(
                          "1+1=3",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Container(
                      width: 131,
                      height: 23,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Center(
                        child: Text(
                          "10% CASHBACK",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
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
