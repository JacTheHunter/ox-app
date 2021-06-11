import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuckingnum/providers/products_provider.dart';
import 'package:fuckingnum/screens/catalog/forgirls/grid_girls_item.dart';
import 'package:fuckingnum/screens/product_detail_page/product_detail_page.dart';
import 'package:fuckingnum/transitions/rightslide.dart';
import 'package:provider/provider.dart';

class For_Girls_Grid extends StatefulWidget {
  @override
  _For_Girls_Grid createState() => _For_Girls_Grid();
}

class _For_Girls_Grid extends State<For_Girls_Grid> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    final productsData = Provider.of<Products>(context);
    final grid = productsData.items;

    return Padding(
      padding: EdgeInsets.fromLTRB(width * .03, 0, width * .03, 0),
      child: GridView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: NeverScrollableScrollPhysics(),
        itemCount: grid.length,
        itemBuilder: (context, i) => ChangeNotifierProvider.value(
          value: grid[i],
          child: GestureDetector(
            child: Grid_Girls_Item(),
            onTap: () {
              Navigator.push(
                context,
                new SlideRightRoute(widget: ProductPage()),
              );
            },
          ),
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.56,
          mainAxisSpacing: 30,
        ),
      ),
    );
  }
}
