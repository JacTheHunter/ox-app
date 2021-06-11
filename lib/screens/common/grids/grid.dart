import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuckingnum/providers/BrandProvider.dart';
import 'package:fuckingnum/screens/branddetail_page/brand_detail_page.dart';
import 'package:fuckingnum/transitions/rightslide.dart';
import 'package:provider/provider.dart';
import 'grid_item.dart';

class Grid_For_Brands extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;

    final productData = Provider.of<BrandProvider>(context);
    final grid = productData.items;
    return Padding(
      padding: EdgeInsets.fromLTRB(width * .022, 0, 0, 0),
      child: Container(
        height: height * .31,
        child: GridView.builder(
          cacheExtent: 2,
          scrollDirection: Axis.horizontal,
          itemCount: grid.length,
          //padding: EdgeInsets.symmetric(horizontal: 16),
          itemBuilder: (context, i) => ChangeNotifierProvider.value(
            value: grid[i],
            child: InkWell(
              child: Grid_Item(),
              onTap: () {
                Navigator.push(
                  context,
                  new SlideRightRoute(widget: BrandDetailPage()),
                );
              },
            ),
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.05,
            crossAxisCount: 2,
            crossAxisSpacing: 0,
            mainAxisSpacing: 5,
          ),
        ),
      ),
    );
  }
}
