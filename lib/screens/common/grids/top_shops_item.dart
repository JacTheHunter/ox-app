import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fuckingnum/screens/models/ShopConstructor.dart';
import 'package:fuckingnum/screens/shopingpage/shoppingdetailpage.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class Top_Shops_Item extends StatefulWidget {
  @override
  _Top_Shop_Item createState() => _Top_Shop_Item();
}

class _Top_Shop_Item extends State<Top_Shops_Item>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    final product = Provider.of<ShopConstructor>(context, listen: false);

    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(ShoppingDetailPage.routeName, arguments: product.id);
      },
      child: Container(
        width: width * .5,
        height: height * .14,
        margin: EdgeInsets.only(left: width * .04, bottom: height * .015),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(29.0)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey[200].withOpacity(0.6),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(
                  width * .02, height * .01), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: width * .02, left: width * .02),
              child: Container(
                width: width * .25,
                height: height * .13,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[200].withOpacity(0.8),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(width * .02,
                          height * .01), // changes position of shadow
                    ),
                  ],
                  image: DecorationImage(
                    image: AssetImage(
                      product.image,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "Celio*",
                    textScaleFactor: 1,
                    style: TextStyle(
                        color: Hexcolor("#0D3662"),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Montserrat',
                        fontSize: 20.0),
                  ),
                  RatingBar(
                    itemSize: width * .05,
                    initialRating: 0,
                    minRating: 0,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: width * .005),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Hexcolor("##FECE2F"),
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  Container(
                    height: height * .038,
                    child: RaisedButton(
                      elevation: 0.0,
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(11.0))),
                      child: Text(
                        '+ Подписаться',
                        textScaleFactor: 1,
                        style: TextStyle(
                          fontSize: 11.0,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      textColor: Colors.white,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: width * .05),
            Container(
              child: IconButton(
                alignment: Alignment.centerRight,
                onPressed: () {
                  Navigator.of(context).pushNamed(ShoppingDetailPage.routeName,
                      arguments: product.id);
                },
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Hexcolor("#0D3662"),
                  size: 24,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
