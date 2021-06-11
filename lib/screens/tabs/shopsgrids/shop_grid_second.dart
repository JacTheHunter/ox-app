import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuckingnum/providers/BrandProvider.dart';
import 'package:fuckingnum/providers/ShopProvider.dart';
import 'package:fuckingnum/screens/shopingpage/shoppingdetailpage.dart';
import 'package:fuckingnum/screens/tabs/shopsgrids/shop_item2.dart';
import 'package:fuckingnum/transitions/rightslide.dart';
import 'package:provider/provider.dart';

class Shop_Grid_Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    var itemWidth = size.width * .05;
    var itemHeight = size.height * .038;
    final productData = Provider.of<ShopProvider>(context);
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
              crossAxisCount: 3, childAspectRatio: itemWidth / itemHeight),
        ),
      ),
    );
  }
}
