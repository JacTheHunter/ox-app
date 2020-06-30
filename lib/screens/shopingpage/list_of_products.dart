import 'package:flutter/material.dart';
import '../models/grid_card_constructor.dart';
import '../models/grid_card_constructor.dart';
import 'list_product_item.dart';

class List_Of_Products extends StatelessWidget {
  final List<Grid_Card_Constructor> girls = [
    Grid_Card_Constructor(image: "icons/girl11.jpg"),
    Grid_Card_Constructor(image: "icons/girl11.jpg"),
    Grid_Card_Constructor(image: "icons/girl11.jpg"),
    Grid_Card_Constructor(image: "icons/girl11.jpg"),
    Grid_Card_Constructor(image: "icons/girl11.jpg"),
    Grid_Card_Constructor(image: "icons/girl11.jpg"),
    Grid_Card_Constructor(image: "icons/girl11.jpg"),
    Grid_Card_Constructor(image: "icons/girl11.jpg"),
    Grid_Card_Constructor(image: "icons/girl11.jpg"),
    Grid_Card_Constructor(image: "icons/girl11.jpg"),
    Grid_Card_Constructor(image: "icons/girl11.jpg"),
    Grid_Card_Constructor(image: "icons/girl11.jpg"),
    Grid_Card_Constructor(image: "icons/girl11.jpg"),
    Grid_Card_Constructor(image: "icons/girl11.jpg"),
    Grid_Card_Constructor(image: "icons/girl11.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.width;
    var width = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.fromLTRB(width * .01, 0, 0, 0),
      child: Container(
        height: height / 1.15,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: girls.length,
          itemBuilder: (context, i) => List_Product_Item(girls[i].image),
        ),
      ),
    );
  }
}
