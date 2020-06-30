import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../categories.dart';
import '../subsubcategory.dart';

class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawer createState() => _NavigationDrawer();
}

class _NavigationDrawer extends State<NavigationDrawer> {


   static Icon add = Icon(Icons.add,color: Color(0xFF0D3662));
  Icon remove = Icon(Icons.remove,color: Color(0xFF0D3662));
  var icon = add;
  int _selectedCat = 0;

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
    return Scaffold(
      backgroundColor: Hexcolor('#F6F8FB'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(25, 74, 24, 24),
            child: Container(
              width: 324,
              height: 34,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Поиск по категориям",
                  hintStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Hexcolor("#B7C1D2")),
                  border: InputBorder.none,
                  suffixIcon: CloseButton(),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Hexcolor("#B7C1D2"),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          Expanded(
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(2, 0, 0, 0),
                  child: Container(
                    width: 95,
                    height: 579,
                    decoration: BoxDecoration(
                      color: Hexcolor("#EBF1FD"),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    child: ListView.builder(
                      itemCount: categories.length,
                      itemBuilder: (ctx, i) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              _selectedCat = i;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.fromLTRB(5, 5, 10, 0),
                            width: 80,
                            height: 80,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: _selectedCat == i
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
                Expanded(
                  flex: 4,
                  child: ListView.builder(
                    itemCount: categories[_selectedCat].subCat.length,
                    itemBuilder: (ctx, i) {
                      final theme = Theme.of(ctx)
                          .copyWith(dividerColor: Hexcolor("#F6F8FB"));
                      return Theme(
                        data: theme,
                        child: ExpansionTile(
                          title: Text(
                            "${categories[_selectedCat].subCat[i].title}",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Montserrat',
                              fontSize: 14,
                              color: Hexcolor("#0D3662"),
                            ),
                          ),
                          onExpansionChanged: (val) {
                            setState(() {
                              icon = icon == remove ? add : remove;
                            });
                          },
                          trailing: icon,
                          children: navigation
                              .map((data) => SubSubItem(
                                  navigation[i].image, navigation[i].title))
                              .toList(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 88),
        ],
      ),
    );
  }
}
