import 'package:flutter/material.dart';
import 'package:fuckingnum/providers/BrandProvider.dart';
import 'package:fuckingnum/screens/branddetail_page/brand_detail_page.dart';
import 'package:fuckingnum/transitions/rightslide.dart';
import 'package:provider/provider.dart';
import 'brands_grid_item.dart';

class Brands_Grid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var size = MediaQuery.of(context).size;

    var itemWidth = size.width * .08;
    var itemHeight = size.height * .028;

    final productData = Provider.of<BrandProvider>(context);
    final grid = productData.items;
    return Container(
      height: height * .48,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: grid.length,
        itemBuilder: (context, i) => ChangeNotifierProvider.value(
          value: grid[i],
          child: InkWell(
            child: Padding(
              padding: EdgeInsets.fromLTRB(5,0,5,0),
              child: Brands_Grid_Item(),
            ),
            onTap: () {
              Navigator.push(
                context,
                new SlideRightRoute(widget: BrandDetailPage()),
              );
            },
          ),
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: itemWidth / itemHeight,
          crossAxisCount: 2,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
        ),
      ),
    );
  }
}
