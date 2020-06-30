import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuckingnum/screens/catalog/forgirls/grid_girls_item.dart';
import '../../models/grid_brand_constructor.dart';

class For_Girls_Grid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    final List<Grid_Constructor> grid = [
      Grid_Constructor(image: 'icons/beatygirl.jpg'),
      Grid_Constructor(image: 'icons/beatygirl.jpg'),
      Grid_Constructor(image: 'icons/beatygirl.jpg'),
      Grid_Constructor(image: 'icons/beatygirl.jpg'),
      Grid_Constructor(image: 'icons/beatygirl.jpg'),
      Grid_Constructor(image: 'icons/beatygirl.jpg'),
      Grid_Constructor(image: 'icons/beatygirl.jpg'),
      Grid_Constructor(image: 'icons/beatygirl.jpg'),
      Grid_Constructor(image: 'icons/beatygirl.jpg'),
      Grid_Constructor(image: 'icons/beatygirl.jpg'),
      Grid_Constructor(image: 'icons/beatygirl.jpg'),
      Grid_Constructor(image: 'icons/beatygirl.jpg'),
      Grid_Constructor(image: 'icons/beatygirl.jpg'),
      Grid_Constructor(image: 'icons/beatygirl.jpg'),
    ];
    return Padding(
      padding: EdgeInsets.fromLTRB(width * .03, 0, width * .03, 0),
      child: GridView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: NeverScrollableScrollPhysics(),
        itemCount: grid.length,
        itemBuilder: (context, i) => Grid_Girls_Item(grid[i].image),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.59,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}
