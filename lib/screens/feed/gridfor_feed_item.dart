import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fuckingnum/screens/models/ShopConstructor.dart';
import 'package:fuckingnum/screens/shopingpage/shoppingdetailpage.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class GridFor_FeedItem extends StatefulWidget {
  bool isSubscribed;

  GridFor_FeedItem({this.isSubscribed = false});

  @override
  _GridFor_FeedItem createState() => _GridFor_FeedItem();
}

class _GridFor_FeedItem extends State<GridFor_FeedItem> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    final productData = Provider.of<ShopConstructor>(context);

    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(ShoppingDetailPage.routeName, arguments: productData.id);
      },
      child: Container(
        width: width,
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Container(
                color: Colors.white,
                child: Image.asset(productData.image),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(width * .03, height * .025, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    productData.appBar,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: "Montserrat",
                        fontSize: 14,
                        color: HexColor('#0D3662')),
                  ),
                  Text(
                    productData.discount,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: "Montserrat",
                      fontSize: 14,
                      color: HexColor('#0D3662'),
                    ),
                  ),
                  Text(
                    productData.cashback,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: "Montserrat",
                      fontSize: 14,
                      color: HexColor('#0D3662'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
