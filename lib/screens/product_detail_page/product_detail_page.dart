import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuckingnum/providers/products_provider.dart';
import 'package:fuckingnum/screens/common/grids/grid.dart';
import 'package:fuckingnum/screens/common/grids/top_shops_item.dart';
import 'package:fuckingnum/screens/product_detail_page/product_card.dart';
import 'package:fuckingnum/screens/product_detail_page/review1.dart';
import 'package:fuckingnum/screens/product_detail_page/reviewItem.dart';
import 'package:fuckingnum/screens/product_detail_page/tabs_prod.dart';
import 'package:fuckingnum/screens/shopingpage/reviews.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'bottom_app_bar.dart';
import 'product_image.dart';
import 'cardpicker.dart';
import 'promotions_list.dart';

class ProductPage extends StatefulWidget {
  static const routeName = '/product';

  @override
  _ProductPage createState() => _ProductPage();
}

class _ProductPage extends State<ProductPage> {
  bool _tapped1 = false;
  bool _tapped2 = false;
  bool _tapped3 = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    final productId =
        ModalRoute.of(context).settings.arguments as String; // is the id!
    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productId);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Hexcolor("#F6F7FB"),
          padding: const EdgeInsets.all(4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Product_Image(),
                  Padding(
                    padding: EdgeInsets.only(top: height * .06),
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: width * .015),
                        BouncingWidget(
                          duration: Duration(milliseconds: 100),
                          scaleFactor: 1.5,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 1,
                                  blurRadius: 8,
                                  offset: Offset(0, 6),
                                ),
                              ],
                            ),
                            child: ClipOval(
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                height: height * .06, // height of the button
                                width: width * 0.1, // width of the button
                                child: Center(
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    color: Color(0xFF0D3662),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: width * .51),
                        StatefulBuilder(
                          builder: (BuildContext ctx, StateSetter setState) =>
                              BouncingWidget(
                            duration: Duration(milliseconds: 100),
                            scaleFactor: 1.5,
                            onPressed: () {
                              setState(() {
                                _tapped1 = !_tapped1;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.4),
                                    spreadRadius: 1,
                                    blurRadius: 8,
                                    offset: Offset(0, 6),
                                  ),
                                ],
                              ),
                              child: ClipOval(
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  height: height * .06,
                                  // height of the button
                                  width: width * 0.1,
                                  // width of the button
                                  child: Center(
                                    child: _tapped1
                                        ? SvgPicture.asset(
                                            'icons/tapped_like.svg')
                                        : SvgPicture.asset('icons/like.svg'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: width * .02),
                        StatefulBuilder(
                          builder: (BuildContext ctx, StateSetter setState) =>
                              BouncingWidget(
                            duration: Duration(milliseconds: 100),
                            scaleFactor: 1.5,
                            onPressed: () {
                              setState(() {
                                _tapped2 = !_tapped2;
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
                                    offset: Offset(0, 6),
                                  ),
                                ],
                              ),
                              child: ClipOval(
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  height: height * .06,
                                  // height of the button
                                  width: width * 0.1,
                                  // width of the button
                                  child: Center(
                                    child: _tapped2
                                        ? SvgPicture.asset(
                                            'icons/tapped_heart.svg')
                                        : SvgPicture.asset('icons/heart.svg'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: width * .02),
                        BouncingWidget(
                          duration: Duration(milliseconds: 100),
                          scaleFactor: 1.5,
                          onPressed: () {
                            final RenderBox box = context.findRenderObject();
                            Share.share('Share test',
                                sharePositionOrigin:
                                    box.localToGlobal(Offset.zero) & box.size);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 1,
                                  blurRadius: 8,
                                  offset: Offset(0, 6),
                                ),
                              ],
                            ),
                            child: ClipOval(
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                height: height * .06, // height of the button
                                width: width * 0.1, // width of the button
                                child: Center(
                                  child: SvgPicture.asset(
                                    'icons/share.svg',
                                    color: Color(0xFF293644),
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
              Padding(
                padding: EdgeInsets.fromLTRB(width * .06, height * .05, 0, 0),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        loadedProduct.price.toString() + ' UZS',
                        style: TextStyle(
                          color: Hexcolor("#0D3662"),
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Montserrat',
                          fontSize: 19.0 / textScaleFactor,
                        ),
                      ),
                      SizedBox(width: width * .03),
                      loadedProduct.oldPrice != null
                          ? Text(
                              loadedProduct.oldPrice.toString() + ' UZS',
                              style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                decorationThickness: 2,
                                decorationColor: Hexcolor("#F92121"),
                                color: Hexcolor("#0D3662"),
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w400,
                                fontSize: 16 / textScaleFactor,
                              ),
                            )
                          : SizedBox.shrink()
                    ],
                  ),
                ),
              ),
              SizedBox(height: height * .01),
              Padding(
                padding: EdgeInsets.fromLTRB(width * .05, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    RatingBar(
                      itemSize: 20,
                      initialRating: 0,
                      minRating: 0,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 1),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Hexcolor("##FECE2F"),
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    SizedBox(width: 7),
                    Text(
                      "5 отзывов",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Montserrat',
                          color: Hexcolor("#0D3662")),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 13),
              Padding(
                padding: EdgeInsets.fromLTRB(width * .06, 0, 0, 0),
                child: Column(
                  children: <Widget>[
                    new Text(
                      loadedProduct.title,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        fontSize: 19.0,
                        color: Hexcolor("#000080"),
                      ),
                    ),
                  ],
                ),
              ),
              Variation(
                productId: productId,
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: height * .01, bottom: height * .01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SvgPicture.asset("icons/rack.svg"),
                    SizedBox(width: 10),
                    Text(
                      "Нужна помощь с размером?",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0,
                        color: Hexcolor("#0D3662"),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              ProductCard(),
              Promotions_List(),
              TabsProduct(),
              Promotions_List(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                    child: Text(
                      "Отзывы покупателей",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        color: Hexcolor("#0D3662"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(14, 5, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        RatingBar(
                          itemSize: 16.5,
                          initialRating: 0,
                          minRating: 0,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 1),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Hexcolor("##FECE2F"),
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        SizedBox(width: 5),
                        Text(
                          "5 отзывов",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Montserrat',
                              color: Hexcolor("#0D3662")),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Review1(),
              SizedBox(height: 10),
              Reviews(),
              Padding(
                padding: EdgeInsets.fromLTRB(18, 10, 0, 10),
                child: Text(
                  "Показать ещё",
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      color: Hexcolor("#0D3662")),
                ),
              ),
              Padding(padding: EdgeInsets.all(10), child: Top_Shops_Item()),
              Padding(
                padding: EdgeInsets.fromLTRB(19, 31, 0, 15),
                child: Text(
                  "С этим ещё покупают",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Montserrat',
                      fontSize: 19,
                      color: Hexcolor("#0D3662")),
                ),
              ),
              Grid_For_Brands(),
              Padding(
                padding: EdgeInsets.fromLTRB(19, 10, 0, 15),
                child: Text(
                  "Другие товары продавца",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Montserrat',
                      fontSize: 19,
                      color: Hexcolor("#0D3662")),
                ),
              ),
              Grid_For_Brands(),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(productId),
    );
  }
}
