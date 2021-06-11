import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fuckingnum/providers/products_provider.dart';
import 'package:fuckingnum/screens/aboutApp.dart';
import 'package:fuckingnum/screens/deliveryAddress.dart';
import 'package:fuckingnum/screens/helpAndFaq.dart';
import 'package:fuckingnum/screens/more/security.dart';
import 'package:fuckingnum/screens/mySales.dart';
import 'package:fuckingnum/screens/settings.dart';
import 'package:fuckingnum/utils/bottom-navigation-bar-utils.dart';
import 'package:fuckingnum/utils/ox-scrol-view.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'change_profile.dart';
import '../wishlist/favourites.dart';
import 'myCards.dart';
import 'myShops.dart';
import 'mybuys/mybuys.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var oxScrollView = OxScrollView(
        ScrollController(),
        Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(30, 50, width * .08, 30),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    new CupertinoPageRoute(
                        builder: (context) => new ChangeProfile()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 7, 10, 7),
                      child: Container(
                        width: 63,
                        height: 63,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25.0),
                          child:
                              Image.asset("icons/julia.jpg", fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Юля Александровна",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Montserrat',
                            fontSize: 16,
                            color: Hexcolor("#0D3662"),
                          ),
                        ),
                        SizedBox(height: 7),
                        Text(
                          "barbaris-1993@gmail.com",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Montserrat',
                            fontSize: 14,
                            color: Hexcolor("#627285"),
                          ),
                        ),
                        Text(
                          "+998 90 ******9",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Montserrat',
                            fontSize: 14,
                            color: Hexcolor("#627285"),
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          new CupertinoPageRoute(
                              builder: (context) => new ChangeProfile()),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Material(
                            color: Colors.white, // button color
                            // inkwell color
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 20,
                                color: Hexcolor("#0D3662"),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(26, 0, 26, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    width: 323,
                    height: 475,
                    decoration: BoxDecoration(
                        color: Hexcolor('#EBF1FD'),
                        borderRadius: BorderRadius.circular(25.0)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              new CupertinoPageRoute(
                                  builder: (context) => new MyBuys()),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(17, 16, 19, 0),
                            child: Container(
                              width: 286,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(14.0)),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    SvgPicture.asset("icons/order.svg"),
                                    SizedBox(width: 15),
                                    Text(
                                      "Мои покупки",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w500,
                                          color: Hexcolor("#0D3662")),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(17, 16, 19, 0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => MyShops(),
                                ),
                              );
                            },
                            child: Container(
                              width: 286,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(14.0)),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    SvgPicture.asset("icons/brands.svg"),
                                    SizedBox(width: 13),
                                    Text(
                                      "Мои магазины (10)",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w500,
                                          color: Hexcolor("#0D3662")),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(17, 16, 19, 0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                new CupertinoPageRoute(
                                    builder: (context) => new MySales()),
                              );
                            },
                            child: Container(
                              width: 286,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(14.0)),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(19, 0, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    SvgPicture.asset("icons/smallcard.svg"),
                                    SizedBox(width: 15),
                                    Text(
                                      "Мои купоны и скидки (1)",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w500,
                                          color: Hexcolor("#0D3662")),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(17, 16, 19, 0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                new CupertinoPageRoute(
                                    builder: (context) => new Favourites()),
                              );
                            },
                            child: Builder(
                              builder: (context) {
                                final productsData =
                                    Provider.of<Products>(context);
                                final grid = productsData.items
                                    .where((element) => element.isFavourite)
                                    .toList();

                                return Container(
                                  width: 286,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(14.0)),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        SvgPicture.asset("icons/heart.svg"),
                                        SizedBox(width: 18),
                                        Text(
                                          "Избранные товары (${grid.length})",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.w500,
                                              color: Hexcolor("#0D3662")),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(17, 16, 19, 0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                new CupertinoPageRoute(
                                    builder: (context) =>
                                        new DeliveryAddress()),
                              );
                            },
                            child: Container(
                              width: 286,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(14.0)),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    SvgPicture.asset("icons/adress.svg"),
                                    SizedBox(width: 15),
                                    Text(
                                      "Мои адреса и доставки",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w500,
                                          color: Hexcolor("#0D3662")),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(17, 16, 19, 0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                new CupertinoPageRoute(
                                    builder: (context) => MyCards()),
                              );
                            },
                            child: Container(
                              width: 286,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(14.0)),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    SvgPicture.asset("icons/credit.svg"),
                                    SizedBox(width: 15),
                                    Text(
                                      "Мои карты оплаты",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w500,
                                          color: Hexcolor("#0D3662")),
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
            ),
            SizedBox(height: 34),
            Padding(
              padding: EdgeInsets.fromLTRB(26, 0, 26, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    width: 323,
                    height: 390,
                    decoration: BoxDecoration(
                        color: Hexcolor('#EBF1FD'),
                        borderRadius: BorderRadius.circular(25.0)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(17, 16, 19, 0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                new CupertinoPageRoute(
                                    builder: (context) => new Security()),
                              );
                            },
                            child: Container(
                              width: width,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(14.0)),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    SvgPicture.asset("icons/security.svg"),
                                    SizedBox(width: 15),
                                    Text(
                                      "Безопасность",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w500,
                                          color: Hexcolor("#0D3662")),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(17, 16, 19, 0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                new CupertinoPageRoute(
                                    builder: (context) => new Settings()),
                              );
                            },
                            child: Container(
                              width: width,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(14.0)),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    SvgPicture.asset("icons/settings.svg"),
                                    SizedBox(width: 15),
                                    Text(
                                      "Ещё настройки",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w500,
                                          color: Hexcolor("#0D3662")),
                                    ),
                                    SizedBox(width: 50),
                                    SvgPicture.asset("icons/russia.svg"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(17, 16, 19, 0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                new CupertinoPageRoute(
                                    builder: (context) => new HelpAndFaq()),
                              );
                            },
                            child: Container(
                              width: width,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(14.0)),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    SvgPicture.asset("icons/about.svg"),
                                    SizedBox(width: 15),
                                    Text(
                                      "Помощь и FAQ",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w500,
                                          color: Hexcolor("#0D3662")),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(17, 16, 19, 0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                new CupertinoPageRoute(
                                    builder: (context) => new AboutApp()),
                              );
                            },
                            child: Container(
                              width: width,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(14.0)),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    SvgPicture.asset("icons/oxlogo.svg"),
                                    SizedBox(width: 15),
                                    Text(
                                      "О приложении OX APP",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w500,
                                          color: Hexcolor("#0D3662")),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              width * .04, height * .02, 0, 0),
                          child: RaisedButton.icon(
                            elevation: 0,
                            color: Hexcolor('#EBF1FD'),
                            onPressed: () => exit(0),
                            icon: SvgPicture.asset("icons/logout.svg"),
                            label: Text(
                              "Выйти",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Hexcolor('#0D3662'),
                                fontFamily: 'Montserrat',
                                fontSize: 14,
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
            SizedBox(height: 60),
          ],
        ),
        GlobalKey());

    var scaffoldWithBottomNavigation = ScaffoldWithBottomNavigation();
    scaffoldWithBottomNavigation.body = oxScrollView;
    return scaffoldWithBottomNavigation;
  }
}
