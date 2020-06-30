import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuckingnum/screens/common/grids/grid.dart';
import 'package:fuckingnum/screens/common/grids/top_shops_item.dart';
import 'package:fuckingnum/screens/product_detail_page/product_card.dart';
import 'package:fuckingnum/screens/product_detail_page/review1.dart';
import 'package:fuckingnum/screens/product_detail_page/review2.dart';
import 'package:fuckingnum/screens/product_detail_page/tabs_prod.dart';
import 'package:hexcolor/hexcolor.dart';
import 'product_image.dart';
import 'cardpicker.dart';
import 'listviewprod.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPage createState() => _ProductPage();
}

class _ProductPage extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    int _counter = 0;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Hexcolor("#F6F7FB"),
          padding: const EdgeInsets.all(4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Product_Image(),
              Padding(
                padding: EdgeInsets.fromLTRB(0, height * .05, width * .20, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      "5 500 000 UZS",
                      style: TextStyle(
                        color: Hexcolor("#0D3662"),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Montserrat',
                        fontSize: 19.0 / textScaleFactor,
                      ),
                    ),
                    Text(
                      "10 500 000 UZS",
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        decorationThickness: 2,
                        decorationColor: Hexcolor("#F92121"),
                        color: Hexcolor("#0D3662"),
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                        fontSize: 16 / textScaleFactor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.0),
              Padding(
                padding: EdgeInsets.fromLTRB(18, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    RatingBar(
                      itemSize: 20,
                      initialRating: 0,
                      minRating: 0,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 1),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Hexcolor("##FECE2F"),
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    SizedBox(width: 7),
                    Text(
                      "5 отзывов",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Montserrat',
                          color: Hexcolor("#0D3662")),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 13),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Column(
                  children: <Widget>[
                    new Text(
                      "Платье женское для повседневнки от Luis Hou",
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          fontSize: 19.0,
                          color: Hexcolor("#000080")),
                    ),
                  ],
                ),
              ),
              Variation(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.asset("icons/rack.svg"),
                  SizedBox(width: 10),
                  Text(
                    "Нужна помощь с размером?",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0,
                      color: Hexcolor("#0D3662"),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              ProductCard(),
              Promotions_List(),
              TabsProduct(),
              Promotions_List(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                    child: Text(
                      "Отзывы покупателей",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        color: Hexcolor("#0D3662"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(14, 5, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        RatingBar(
                          itemSize: 16.5,
                          initialRating: 0,
                          minRating: 0,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 1),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Hexcolor("##FECE2F"),
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        SizedBox(width: 5),
                        Text(
                          "5 отзывов",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Montserrat',
                              color: Hexcolor("#0D3662")),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Review1(),
              SizedBox(height: 10),
              Review2(),
              SizedBox(height: 10),
              Review2(),
              Padding(
                padding: EdgeInsets.fromLTRB(18, 10, 0, 10),
                child: Text(
                  "Показать ещё",
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      color: Hexcolor("#0D3662")),
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: Top_Shops_Item('icons/polo.png')),
              Padding(
                padding: EdgeInsets.fromLTRB(19, 31, 0, 15),
                child: Text(
                  "С этим ещё покупают",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Montserrat',
                      fontSize: 19,
                      color: Hexcolor("#0D3662")),
                ),
              ),
              Grid_For_Brands(),
              Padding(
                padding: EdgeInsets.fromLTRB(19, 10, 0, 15),
                child: Text(
                  "Другие товары продавца",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Montserrat',
                      fontSize: 19,
                      color: Hexcolor("#0D3662")),
                ),
              ),
              Grid_For_Brands(),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0.0,
        child: Container(
          padding: EdgeInsets.only(left: width / 35, top: height / 70),
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
            children: <Widget>[
              Container(
                height: height / 16,
                decoration: BoxDecoration(
                    color: Color(0xFFEBF1FD),
                    borderRadius: BorderRadius.circular(21)),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.add,
                        color: Color(0xFF0D3662),
                      ),
                      onPressed: () {
                        setState(() {
                          _counter++;
                        });
                      },
                    ),
                    Text(
                      ' $_counter ',
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
                      ),
                      onPressed: () {
                        setState(
                          () {
                            if (_counter >= 1) {
                              _counter--;
                            }
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(width: width / 30),
              Container(
                padding: EdgeInsets.only(left: width / 20, right: width / 20),
                height: height / 16,
                width: width / 1.6,
                decoration: BoxDecoration(
                  color: Color(0xFFFF2D87),
                  borderRadius: BorderRadius.circular(31),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    Text(
                      '5 500 000 UZS',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 13 / textScaleFactor,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
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
