import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fuckingnum/screens/catalog/grid_hot_buys.dart';
import 'package:fuckingnum/screens/catalog/more_button.dart';
import 'package:fuckingnum/screens/product_detail_page/listviewprod.dart';
import 'package:fuckingnum/screens/product_detail_page/review1.dart';
import 'package:fuckingnum/screens/product_detail_page/review2.dart';
import 'package:fuckingnum/screens/shopingpage/tabs_for_shops.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'bottomsheet.dart';
import 'balance.dart';

class ShopingDetailPage extends StatefulWidget {
  @override
  _ShopingDetailPage createState() => _ShopingDetailPage();
}

class _ShopingDetailPage extends State<ShopingDetailPage> {
  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      backgroundColor: Hexcolor("#F7F8FB"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Container(
                  child: Image.asset(
                    'icons/polo1.jpg',
                    width: width,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Positioned(
                  left: width / 6.5,
                  top: height / 6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            "7 тысч.",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Montserrat',
                                fontSize: 18 / textScaleFactor,
                                color: Colors.white),
                          ),
                          SizedBox(height: 6),
                          Text(
                            "Подписчики",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Montserrat',
                                fontSize: 12 / textScaleFactor,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(width: width * .04),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              width: 80,
                              height: 80,
                              color: Colors.white,
                              child: GridTile(
                                child: Image.asset('icons/polo.png',
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
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
                        ],
                      ),
                      SizedBox(width: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            "74 тысч.",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Montserrat',
                                fontSize: 18,
                                color: Colors.white),
                          ),
                          SizedBox(height: 6),
                          Text(
                            "Товаров",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Montserrat',
                                fontSize: 12,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: height / 2.85,
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: width/20),
                      RaisedButton(
                        color: Hexcolor("#2F80ED"),
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        child: Text(
                          "+ Подписаться",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(width: width/40),
                      RaisedButton(
                        color: Hexcolor("#627285"),
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        child: Text(
                          "   Сообщение   ",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                      RawMaterialButton(
                        onPressed: () {},
                        fillColor: Hexcolor("#627285"),
                        child: SvgPicture.asset('icons/phone.svg'),
                        shape: CircleBorder(),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  child: AppBar(
                    centerTitle: true,
                    title: Text(
                      "U.S. POLO ASSN.",
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w600),
                    ),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    leading: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    actions: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 17, 0),
                        child: SvgPicture.asset(
                          'icons/share.svg',
                          height: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(21, 20, 0, 0),
              child: Row(
                children: <Widget>[
                  Text(
                    "#одежда обувь и аксессуары #мужская #женская",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: "montserrat",
                      fontSize: 12,
                      color: Hexcolor("#627285"),
                    ),
                  ),
                ],
              ),
            ),
            Balance(),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: Text(
                "Ваш статус",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: "Montserrat",
                  fontSize: 19,
                  color: Hexcolor("#0D3662"),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: Container(
                width: 48,
                height: 24,
                decoration: BoxDecoration(
                    color: Hexcolor("#FECE2F"),
                    borderRadius: BorderRadius.circular(20.0)),
                child: Center(
                  child: Text(
                    "VIP",
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
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: Text(
                "-15% скидка на любой товар",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: "Montserrat",
                  fontSize: 16,
                  color: Hexcolor("#627285"),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              height: 0,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Divider(height: 0, color: Colors.black),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: Container(
                width: 116,
                height: 24,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20.0)),
                child: Center(
                  child: Text(
                    "cashback 5%",
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
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
              child: Text(
                "5% кэшбэк на товары вне акции",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: "Montserrat",
                  fontSize: 16,
                  color: Hexcolor("#627285"),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
              child: Text(
                "Действующие акции",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: "Montserrat",
                  fontSize: 19,
                  color: Hexcolor("#0D3662"),
                ),
              ),
            ),
            Promotions_List(),
            Tabs_For_Shops(),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text(
                "Отзывы покупателей",
                style: TextStyle(
                  fontSize: 19,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w600,
                  color: Hexcolor("#0D3662"),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(22, 0, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  RatingBar(
                    itemSize: 25,
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
            Review1(),
            SizedBox(height: 10),
            Review2(),
            SizedBox(height: 10),
            Review2(),
            More_Button(),
            Padding(
              padding: EdgeInsets.fromLTRB(26, 10, 0, 14),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        "Популярные товары",
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            fontSize: 19.0,
                            color: Hexcolor("#000080")),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        "магазина  US POLO ASSN",
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            fontSize: 19.0,
                            color: Hexcolor("#000080")),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Grid_Hot_Buys(),
            Padding(
              padding: EdgeInsets.fromLTRB(17, 30, 17, 58),
              child: Container(
                width: width,
                height:height/12,
                child: RaisedButton(
                  elevation: 0.0,
                  child: Text(
                    'ВЕСЬ АССОРТИМЕНТ',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(31),
                  ),
                  padding: const EdgeInsets.all(15),
                  color: Hexcolor("#FF2D87"),
                  textColor: Colors.white,
                  onPressed: () {},
                ),
              ),
            ),
            Bottom_Sheet(),
          ],
        ),
      ),
    );
  }
}
