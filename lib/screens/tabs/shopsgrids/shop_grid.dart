import 'package:flutter/material.dart';

import 'package:fuckingnum/screens/tabs/shopsgrids/shop_item.dart';

import '../../models/grid_brand_constructor.dart';

class Shop_Grid extends StatelessWidget{

  final List<Grid_Constructor> grid = [
    Grid_Constructor(image: 'icons/polo.png'),
    Grid_Constructor(image: 'icons/polo.png'),
    Grid_Constructor(image: 'icons/polo.png'),
    Grid_Constructor(image: 'icons/polo.png'),
    Grid_Constructor(image: 'icons/polo.png'),
    Grid_Constructor(image: 'icons/polo.png'),
    Grid_Constructor(image: 'icons/polo.png'),
    Grid_Constructor(image: 'icons/polo.png'),
    Grid_Constructor(image: 'icons/polo.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(17, 0, 0, 0),
      child: Container(
        height: 330,
        child: GridView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: grid.length,
          itemBuilder: (context, i) => Shop_Item1(grid[i].image),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.4,
            crossAxisCount: 2,
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
          ),
        ),
      ),
    );
  }
}