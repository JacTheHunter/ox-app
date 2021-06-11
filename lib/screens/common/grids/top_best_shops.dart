import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuckingnum/providers/ShopProvider.dart';
import 'package:fuckingnum/screens/common/grids/top_shops_item.dart';
import 'package:fuckingnum/screens/shopingpage/shoppingdetailpage.dart';
import 'package:fuckingnum/transitions/rightslide.dart';
import 'package:provider/provider.dart';

class TopShops extends StatefulWidget {
  @override
  _TopShops createState() => _TopShops();
}

class _TopShops extends State<TopShops> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    final productData = Provider.of<ShopProvider>(context);
    final grid = productData.items;
    return Padding(
      padding: EdgeInsets.all(2),
      child: Container(
        height: height * .7,
        child: GridView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: grid.length,
          itemBuilder: (context, i) => ChangeNotifierProvider.value(
            value: grid[i],
            child: InkWell(
              child: Top_Shops_Item(),
              onTap: () {
                Navigator.push(
                  context,
                  new SlideRightRoute(widget: ShoppingDetailPage()),
                );
              },
            ),
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.4,
            crossAxisCount: 4,
            crossAxisSpacing: 0,
            mainAxisSpacing: 5,
          ),
        ),
      ),
    );
  }
}
