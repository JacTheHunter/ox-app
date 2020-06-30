import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/grid_brand_constructor.dart';
import 'top_shops_item.dart';

class TopShops extends StatelessWidget {
  final List<Grid_Constructor> grid_1 = [
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
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    SizedBox(height: height * .03);
    return Container(
      padding: EdgeInsets.fromLTRB(width * .04, 0, 0, 0),
      height: height / 1.15,
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: grid_1.length,
        itemBuilder: (context, i) => Top_Shops_Item(grid_1[i].image),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 4,
            childAspectRatio: 0.39),
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
