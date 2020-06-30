import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/grid_brand_constructor.dart';
import 'grid_item.dart';

class Grid_For_Brands extends StatelessWidget {
  final List<Grid_Constructor> brandsGrid = [
    Grid_Constructor(image: 'icons/1.png'),
    Grid_Constructor(image: 'icons/okaidi.jpg'),
    Grid_Constructor(image: 'icons/morgan.jpg'),
    Grid_Constructor(image: 'icons/chicco.jpg'),
    Grid_Constructor(image: 'icons/iam.jpg'),
    Grid_Constructor(image: 'icons/bata.jpg'),
    Grid_Constructor(image: 'icons/1.png'),
    Grid_Constructor(image: 'icons/1.png'),
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.fromLTRB(width * .022, 0, 0, 0),
      child: Container(
        height: height / 3.2,
        child: GridView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: brandsGrid.length,
          itemBuilder: (context, i) => Grid_Item(brandsGrid[i].image),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1,
            crossAxisCount: 2,
            crossAxisSpacing: 0,
            mainAxisSpacing: 5,
          ),
        ),
      ),
    );
  }
}
