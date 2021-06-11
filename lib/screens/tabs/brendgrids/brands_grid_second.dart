import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuckingnum/providers/BrandProvider.dart';
import 'package:fuckingnum/screens/branddetail_page/brand_detail_page.dart';
import 'package:fuckingnum/transitions/rightslide.dart';
import 'package:provider/provider.dart';
import 'brands_grid_item.dart';

class Brands_Grid_Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    var itemWidth = size.width * .05;
    var itemHeight = size.height * .038;
    final productData = Provider.of<BrandProvider>(context);
    final grid = productData.items;
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 29, 10, 40),
      child: Container(
        child: GridView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: NeverScrollableScrollPhysics(),
          itemCount: grid.length,
          itemBuilder: (context, i) => ChangeNotifierProvider.value(
            value: grid[i],
            child: GestureDetector(
              child: Padding(
                padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
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
              crossAxisCount: 3, childAspectRatio: itemWidth / itemHeight),
        ),
      ),
    );
  }
}
