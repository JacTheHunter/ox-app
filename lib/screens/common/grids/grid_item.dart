import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuckingnum/screens/branddetail_page/brand_detail_page.dart';
import 'package:fuckingnum/screens/models/grid_brand_constructor.dart';
import 'package:provider/provider.dart';

class Grid_Item extends StatefulWidget {
  @override
  _Grid_Item_State createState() => _Grid_Item_State();
}

class _Grid_Item_State extends State<Grid_Item>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<GridConstructor>(context, listen: false);
    return Padding(
      padding: EdgeInsets.all(5),
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .pushNamed(BrandDetailPage.routeName, arguments: product.id);
        },
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Color(0xFFF6F7FB),
                spreadRadius: 5,
                blurRadius: 7,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: Colors.white,
              width: 106,
              height: 106,
              child: GridTile(
                child: Image.asset(product.image, fit: BoxFit.contain),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
