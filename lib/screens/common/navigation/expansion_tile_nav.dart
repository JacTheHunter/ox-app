import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../categories.dart';
import '../subsubcategory.dart';

final List<SubSubCategories> navigation = [
  SubSubCategories(image: 'icons/clothes.jpg', title: 'Одежда'),
  SubSubCategories(image: 'icons/shoes.jpg', title: 'Обувь'),
  SubSubCategories(image: 'icons/sunglassses.jpg', title: 'Аксессуары'),
  SubSubCategories(image: 'icons/socks.png', title: 'Чулки , носки , колготки'),
  SubSubCategories(image: 'icons/homeweather.png', title: 'Домашняя одежда'),
  SubSubCategories(
      image: 'icons/clothesforgirls.png', title: 'Одежда для беременных'),
];

class ExpansionList extends StatefulWidget {
  int selectedCategory;
  int index;

  ExpansionList({this.index, this.selectedCategory});
  @override
  _ExpansionListsState createState() => _ExpansionListsState();
}

class _ExpansionListsState extends State<ExpansionList> {
  static Icon add = Icon(Icons.add, color: Color(0xFF0D3662));
  Icon remove = Icon(Icons.remove, color: Color(0xFF0D3662));
  var icon = add;
  @override
  Widget build(BuildContext context) {
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;
    return ExpansionTile(
      title: Text(
        "${categories[widget.selectedCategory].subCat[widget.index].title}",
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontFamily: 'Montserrat',
          fontSize: 14 / textScaleFactor,
          color: Hexcolor("#0D3662"),
        ),
      ),
      onExpansionChanged: (val) {
        setState(() {
          icon = icon == remove ? add : remove;
        });
      },
      trailing: icon,
      children:
      navigation.map((data) => SubSubItem(data.image, data.title)).toList(),
    );
  }
}
