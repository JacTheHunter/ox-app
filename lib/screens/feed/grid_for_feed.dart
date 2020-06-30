import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/grid_element.dart';
import 'gridfor_feed_item.dart';


class GridFor_Feed extends StatelessWidget {
  final List<Grid_Element> feed_grid = [
    Grid_Element(
        image: 'icons/avva.png',
        brand: "AVVA",
        discount: "10% discount",
        cashback: "5% cashback"),
    Grid_Element(
        image: 'icons/skechers.png',
        brand: "Skechers",
        discount: "15% discount",
        cashback: "5% cashback"),
    Grid_Element(
        image: 'icons/etam.png',
        brand: "Etam",
        discount: "10% discount",
        cashback: "7% cashback"),
    Grid_Element(
        image: 'icons/derimod.png',
        brand: "AVVA",
        discount: "10% discount",
        cashback: "5% cashback"),
    Grid_Element(

        image: 'icons/avva.png',
        brand: "Celio",
        discount: "10% discount",
        cashback: "5% cashback"),
    Grid_Element(
        image: 'icons/skechers.png',
        brand: "AVVA",
        discount: "10% discount",
        cashback: "5% cashback"),
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.fromLTRB(width * .05 , 0, 0, 0),
      child: Container(
        height: 317,
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: feed_grid.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) => GridFor_FeedItem(feed_grid[i].image,
              feed_grid[i].brand, feed_grid[i].discount, feed_grid[i].cashback),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.4,
            crossAxisCount: 3,
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
          ),
        ),
      ),
    );
  }
}
