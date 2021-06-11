import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:fuckingnum/providers/products_provider.dart';
import 'package:fuckingnum/screens/models/cart_constructor.dart';
import 'package:fuckingnum/screens/models/pdp_constructor.dart';
import 'package:fuckingnum/screens/product_detail_page/product_detail_page.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class Grid_Girls_Item extends StatefulWidget {
  bool isFavorite;

  Grid_Girls_Item({this.isFavorite = false});

  @override
  _Grid_Girls_ItemState createState() => _Grid_Girls_ItemState();
}

class _Grid_Girls_ItemState extends State<Grid_Girls_Item>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    final product = Provider.of<PDP_Constructor>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);

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
            width: width * .5,
            height: height * .35,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Stack(
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
                        width * .33, height * .01, 0, height * .01),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Consumer<PDP_Constructor>(
                          builder: (ctx, product, child) => BouncingWidget(
                            duration: Duration(milliseconds: 100),
                            scaleFactor: 1.5,
                            onPressed: () {
                              Provider.of<Products>(context, listen: false)
                                  .updateFavorite(
                                  product.id, !this.widget.isFavorite);
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
                                    child: SvgPicture.asset(
                                      this.widget.isFavorite
                                          ? "icons/tapped_heart.svg"
                                          : "icons/heart.svg",
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Consumer<PDP_Constructor>(
                          builder: (ctx, product, child) => BouncingWidget(
                            duration: Duration(milliseconds: 100),
                            scaleFactor: 1.5,
                            onPressed: () {
                              cart.addItem(
                                product.image,
                                product.id,
                                product.price,
                                product.oldPrice,
                                product.title,
                                product.colors[0],
                                product.sizes[0],
                              );
                              Scaffold.of(context).removeCurrentSnackBar();
                              Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text(
                                  'Добавлено',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Montserrat',
                                  ),
                                ),
                                duration: Duration(milliseconds: 700),
                                backgroundColor:
                                Colors.black54.withOpacity(0.5),
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
                                  height: height * .04, // height of the button
                                  width: width * .08, // width of the button
                                  child: Center(
                                    child: SvgPicture.asset(
                                      "icons/basket.svg",
                                      fit: BoxFit.contain,
                                    ),
                                  ),
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
            padding: EdgeInsets.fromLTRB(width * .025, 0, 0, 0),
            child: Text(
              product.title,
              style: TextStyle(
                  fontSize: 11 / textScaleFactor,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  color: Hexcolor("#627285")),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(width * .025, height * .002, 0, 0),
            child: Row(
              children: <Widget>[
                Text(
                  product.price.toString() + ' UZS',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Montserrat',
                    fontSize: 14 / textScaleFactor,
                    color: Hexcolor('#0D3662'),
                  ),
                ),
                Padding(
                  padding:
                  EdgeInsets.only(left: width * .06, bottom: height * .001),
                  child: Container(
                    padding:
                    EdgeInsets.only(left: width * .01, right: width * .01),
                    height: height * .025,
                    decoration: BoxDecoration(
                        color: Hexcolor("#FF1C1C"),
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Center(
                      child: Text(
                        "-50%",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0 / textScaleFactor,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          product.oldPrice != null
              ? Padding(
            padding: EdgeInsets.fromLTRB(width * .025, 0, 0, 0),
            child: Text(
              product.oldPrice.toString() + ' UZS',
              style: TextStyle(
                decoration: TextDecoration.lineThrough,
                decorationColor: Colors.red,
                decorationThickness: 2,
                fontWeight: FontWeight.w400,
                fontFamily: 'Montserrat',
                fontSize: 14 / textScaleFactor,
                color: Hexcolor('#0D3662'),
              ),
            ),
          )
              : SizedBox(height: height * .021)
        ],
      ),
    );
  }
}

class Draw extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p1 = Offset(-1, 11);
    final p2 = Offset(110, 6.5);
    final paint = Paint()
      ..color = Hexcolor('#F92121')
      ..strokeWidth = 1.1;
    canvas.drawLine(p1, p2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
