import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:provider/provider.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuckingnum/screens/models/pdp_constructor.dart';
import 'package:fuckingnum/screens/product_detail_page/product_detail_page.dart';

class List_Product_Item extends StatefulWidget {
  @override
  _List_Product_ItemState createState() => _List_Product_ItemState();
}

class _List_Product_ItemState extends State<List_Product_Item>
    with SingleTickerProviderStateMixin {
  bool _tapped = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;
    final product = Provider.of<PDP_Constructor>(context, listen: false);
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(ProductPage.routeName, arguments: product.id);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            width: width / 2.1,
            height: height / 2.7,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: new Stack(
                children: <Widget>[
                  Carousel(
                    boxFit: BoxFit.cover,
                    images: [
                      AssetImage(product.image),
                      AssetImage(product.image),
                      AssetImage(product.image),
                      AssetImage(product.image),
                    ],
                    dotIncreaseSize: 1.01,
                    animationCurve: Curves.fastOutSlowIn,
                    autoplay: false,
                    dotSize: 6,
                    dotSpacing: 10,
                    dotIncreasedColor: Colors.white,
                    dotColor: Colors.white.withOpacity(0.5),
                    dotBgColor: Colors.transparent,
                    indicatorBgPadding: 9.0,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        width * .34, height * .0075, 0, height * .0075),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        BouncingWidget(
                          duration: Duration(milliseconds: 100),
                          scaleFactor: 1.5,
                          onPressed: () {
                            setState(() {
                              _tapped = !_tapped;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 1,
                                  blurRadius: 8,
                                  offset: Offset(0, 5),
                                ),
                              ],
                            ),
                            child: ClipOval(
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                height: height * .04, // height of the button
                                width: width * .08, // width of the button
                                child: Center(
                                  child: _tapped
                                      ? SvgPicture.asset(
                                      'icons/tapped_heart.svg')
                                      : SvgPicture.asset(
                                    "icons/heart.svg",
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        BouncingWidget(
                          duration: Duration(milliseconds: 100),
                          scaleFactor: 1.5,
                          onPressed: () {
                            Scaffold.of(context).hideCurrentSnackBar();
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text(
                                'Добавлено',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Montserrat',
                                ),
                              ),
                              duration: Duration(milliseconds: 500),
                              backgroundColor: Colors.black54.withOpacity(0.5),
                              behavior: SnackBarBehavior.floating,
                            ));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 1,
                                  blurRadius: 8,
                                  offset: Offset(0, 5),
                                ),
                              ],
                            ),
                            child: ClipOval(
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                height: height * .038, // height of the button
                                width: width * .078, // wiidth of the button
                                child: Center(
                                  child: SvgPicture.asset("icons/basket.svg"),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(width * .03, 0, 0, 0),
            child: Text(
              product.title,
              style: TextStyle(
                fontSize: 11 / textScaleFactor,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
                color: Hexcolor("#627285"),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(width * .03, 0, 0, 0),
            child: Text(
              product.price.toString(),
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: 'Montserrat',
                fontSize: 14 / textScaleFactor,
                color: Hexcolor('#0D3662'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
