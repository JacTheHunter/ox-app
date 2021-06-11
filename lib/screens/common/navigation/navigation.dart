import 'dart:ui';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../categories.dart';
import 'expansion_tile_nav.dart';

class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawer createState() => _NavigationDrawer();
}

class _NavigationDrawer extends State<NavigationDrawer> {
  static Icon add = Icon(Icons.add, color: Color(0xFF0D3662));
  Icon remove = Icon(Icons.remove, color: Color(0xFF0D3662));
  var icon = add;
  int selectedCat = 0;

  final List<SubSubCategories> navigation = [
    SubSubCategories(image: 'icons/clothes.jpg', title: 'Одежда'),
    SubSubCategories(image: 'icons/shoes.jpg', title: 'Обувь'),
    SubSubCategories(image: 'icons/sunglassses.jpg', title: 'Аксессуары'),
    SubSubCategories(
        image: 'icons/socks.png', title: 'Чулки , носки , колготки'),
    SubSubCategories(image: 'icons/homeweather.png', title: 'Домашняя одежда'),
    SubSubCategories(
        image: 'icons/clothesforgirls.png', title: 'Одежда для беременных'),
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      backgroundColor: Hexcolor('#F6F8FB'),
      body: GestureDetector(
        onPanUpdate: (dis) {
          if (dis.delta.dx < 0) {
            Navigator.of(context).pop();
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(25, 74, 24, 0),
              child: Container(
                width: width * .9,
                height: height * .05,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Поиск по категориям",
                    hintStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 16 / textScaleFactor,
                        fontWeight: FontWeight.w500,
                        color: Hexcolor("#B7C1D2")),
                    border: InputBorder.none,
                    suffixIcon: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.close,
                        color: Hexcolor("#0D3662"),
                        size: 30,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Hexcolor("#B7C1D2"),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: height * .02),
              child: Container(
                margin: EdgeInsets.only(left: width / 11),
                height: height * .001,
                width: width * .65,
                color: Hexcolor("#B7C1D2"),
              ),
            ),
            SizedBox(height: 15),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                    child: Container(
                      width: width * .25,
                      decoration: BoxDecoration(
                        color: Hexcolor("#EBF1FD"),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      ),
                      child: ListView.builder(
                        padding: EdgeInsets.only(top: height * .01),
                        itemCount: categories.length,
                        itemBuilder: (ctx, i) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedCat = i;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.fromLTRB(5, 0, 10, 0),
                              width: 80,
                              height: 80,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: selectedCat == i
                                    ? Colors.white
                                    : Hexcolor("#EBF1FD"),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0)),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    SvgPicture.asset(categories[i].image),
                                    Text(
                                      "${categories[i].title}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 9,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w500,
                                          color: Hexcolor("#0D3662")),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  //Sub SUb categories
                  Flexible(
                    child: Container(
                      child: ListView.builder(
                        padding: EdgeInsets.only(bottom: height * .09),
                        itemCount: categories[selectedCat].subCat.length,
                        itemBuilder: (ctx, i) {
                          final theme = Theme.of(ctx)
                              .copyWith(dividerColor: Hexcolor("#F6F8FB"));
                          return Theme(
                            data: theme,
                            child: ExpansionList(
                                selectedCategory: selectedCat, index: i),
                          );
                        },
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
