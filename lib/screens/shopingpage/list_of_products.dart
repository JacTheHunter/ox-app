import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'list_product_item.dart';
import '../../transitions/rightslide.dart';
import 'package:fuckingnum/screens/product_detail_page/product_detail_page.dart';
import 'package:fuckingnum/providers/products_provider.dart';

class List_Of_Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final item = productsData.items;
    var height = MediaQuery.of(context).size.width;
    var width = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.fromLTRB(width * .01, 0, 0, 0),
      child: Container(
        height: height / 1.15,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: item.length,
          itemBuilder: (context, i) => ChangeNotifierProvider.value(
            value: item[i],
            child: InkWell(
              child: List_Product_Item(),
              onTap: () {
                Navigator.push(
                  context,
                  new SlideRightRoute(widget: ProductPage()),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
