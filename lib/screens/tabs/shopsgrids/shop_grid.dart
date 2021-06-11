import 'package:flutter/material.dart';
import 'package:fuckingnum/providers/ShopProvider.dart';
import 'package:fuckingnum/screens/shopingpage/shoppingdetailpage.dart';
import 'package:fuckingnum/screens/tabs/shopsgrids/shop_item2.dart';
import 'package:fuckingnum/transitions/rightslide.dart';
import 'package:provider/provider.dart';

class Shop_Grid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var size = MediaQuery.of(context).size;
    var itemWidth = size.width * .08;
    var itemHeight = size.height * .028;

    final productData = Provider.of<ShopProvider>(context);
    final grid = productData.items;
    return Container(
      height: height * .48,
      child: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 8),
        scrollDirection: Axis.horizontal,
        itemCount: grid.length,
        itemBuilder: (context, i) => ChangeNotifierProvider.value(
          value: grid[i],
          child: InkWell(
            child: Padding(
              padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: Shop_Item2(),
            ),
            onTap: () {
              Navigator.push(
                context,
                new SlideRightRoute(widget: ShoppingDetailPage()),
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
