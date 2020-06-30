import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../models/grid_brand_constructor.dart';
import 'brands_grid_item.dart';

class Brands_Grid_Second extends StatelessWidget {
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
      padding: EdgeInsets.fromLTRB(17, 29, 3, 40),
      child: GridView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: NeverScrollableScrollPhysics(),
        itemCount: grid.length,
        itemBuilder: (context, i) => Brands_Grid_Item(grid[i].image),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.74,
          mainAxisSpacing: 8
        ),
      ),
    );
  }
}
