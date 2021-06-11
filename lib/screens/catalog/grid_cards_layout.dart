import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuckingnum/screens/models/grid_card_constructor.dart';
import 'grid_card_item.dart';

class Grid_Cards_Layout extends StatelessWidget {
  final List<Grid_Card_Constructor> gridElements = [
    Grid_Card_Constructor(image: 'images/forher.jpg', title: 'Для неё'),
    Grid_Card_Constructor(image: 'images/forhim.jpg', title: 'Для него'),
    Grid_Card_Constructor(image: 'images/forboys.jpg', title: 'Для мальчиков'),
    Grid_Card_Constructor(image: 'images/forgirls.jpg', title: 'Для девочек'),
  ];

  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.fromLTRB(width * .04, 0, width * .04, 0),
      child: GridView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: gridElements.length,
        itemBuilder: (context, i) =>
            Grid_Card_Item(gridElements[i].image, gridElements[i].title),
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.60,
            mainAxisSpacing: 4,
            crossAxisSpacing: 2),
      ),
    );
  }
}
