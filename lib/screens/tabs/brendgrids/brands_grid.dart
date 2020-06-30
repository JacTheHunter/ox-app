import 'package:flutter/material.dart';
import '../../models/grid_brand_constructor.dart';
import 'brands_grid_item.dart';

class Brands_Grid extends StatelessWidget {
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
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(17, 0, 0, 0),
      child: Container(
        height: 300,
        child: GridView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: grid.length,
          itemBuilder: (context, i) => Brands_Grid_Item(grid[i].image),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.25,
            crossAxisCount: 2,
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
          ),
        ),
      ),
    );
  }
}
