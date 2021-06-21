import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fuckingnum/providers/ShopProvider.dart';
import 'package:fuckingnum/screens/catalog/grid_hot_buys.dart';
import 'package:fuckingnum/screens/catalog/more_button.dart';
import 'package:fuckingnum/screens/product_detail_page/promotions_list.dart';
import 'package:fuckingnum/screens/product_detail_page/review1.dart';
import 'package:fuckingnum/screens/product_detail_page/reviewItem.dart';
import 'package:fuckingnum/screens/shopingpage/reviews.dart';
import 'package:fuckingnum/screens/shopingpage/shoping_image.dart';
import 'package:fuckingnum/screens/shopingpage/tabs_for_shops.dart';
import 'package:fuckingnum/utils/bottom-navigation-bar-utils.dart';
import 'package:fuckingnum/utils/ox-scrol-view.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../providers/reviewsProvider.dart';
import 'bottomsheet.dart';
import 'balance.dart';

class ShoppingDetailPage extends StatefulWidget {
  static const routeName = '/shop';

  @override
  _ShoppingDetailPage createState() => _ShoppingDetailPage();
}

class _ShoppingDetailPage extends State<ShoppingDetailPage> {
  double _currentOpacity = 1;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        kToolbarHeight -
        kBottomNavigationBarHeight;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    final productId =
        ModalRoute.of(context).settings.arguments as String; // is the id!
    final loadedProduct = Provider.of<ShopProvider>(
      context,
      listen: false,
    ).findById(productId);

    var scaffoldWithBottomNavigation = ScaffoldWithBottomNavigation();
    scaffoldWithBottomNavigation.body = OxScrollView(
        ScrollController(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: width,
              height: height * .45,
              child: Stack(
                //overflow: Overflow.visible,
                children: <Widget>[
                  Align(child: Shopping_Image()),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: width,
                      height: height * .1,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: Stack(
                        children: <Widget>[
                          Align(
                            child: Text(
                              loadedProduct.appBar,
                              textScaleFactor: 1,
                              style: TextStyle(
                                  fontFamily: "Montserrat",
                                  color: Colors.white,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                final RenderBox box =
                                    context.findRenderObject();
                                Share.share('Share test',
                                    sharePositionOrigin:
                                        box.localToGlobal(Offset.zero) &
                                            box.size);
                              },
                              child: SvgPicture.asset(
                                'icons/share.svg',
                                height: height * .06,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(21, 40, 0, 0),
              child: Row(
                children: <Widget>[
                  Text(
                    "#одежда обувь и аксессуары #мужская #женская",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: "montserrat",
                      fontSize: 12,
                      color: HexColor("#627285"),
                    ),
                  ),
                ],
              ),
            ),
            Balance(),
            Padding(
              padding: EdgeInsets.fromLTRB(width * .05, height * .06, 0, 0),
              child: Text(
                "Ваш статус",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: "Montserrat",
                  fontSize: 19,
                  color: HexColor("#0D3662"),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(width * .05, 20, 0, 0),
              child: Container(
                width: 48,
                height: 24,
                decoration: BoxDecoration(
                    color: HexColor("#FECE2F"),
                    borderRadius: BorderRadius.circular(20.0)),
                child: Center(
                  child: Text(
                    "VIP",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(width * .05, height * .01, 0, 0),
              child: Text(
                "-15% скидка на любой товар",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: "Montserrat",
                  fontSize: 16,
                  color: HexColor("#627285"),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, height * .015, 0, 0),
              height: 0,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Divider(height: 0, color: Colors.black),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(width * .05, height * .06, 0, 0),
              child: Container(
                width: 116,
                height: 24,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20.0)),
                child: Center(
                  child: Text(
                    "cashback 5%",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(width * .05, 10, 0, height * .04),
              child: Text(
                "5% кэшбэк на товары вне акции",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: "Montserrat",
                  fontSize: 16 / textScaleFactor,
                  color: HexColor("#627285"),
                ),
              ),
            ),
            StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) =>
                  AnimatedOpacity(
                opacity: _currentOpacity,
                duration: Duration(seconds: 1),
                child: _currentOpacity == 0
                    ? SizedBox()
                    : Container(
                        padding: EdgeInsets.only(
                            top: height * .03, bottom: height / 50),
                        margin: EdgeInsets.only(left: width / 23),
                        width: width / 1.1,
                        decoration: BoxDecoration(
                          color: Color(0xFFEBF1FD),
                          borderRadius: BorderRadius.circular(29),
                        ),
                        child: LayoutBuilder(
                          builder: (context, constraints) => Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  SizedBox(width: constraints.maxWidth * 0.09),
                                  SvgPicture.asset('icons/alert.svg'),
                                  SizedBox(width: width / 30),
                                  Text(
                                    'Обратите внимание!',
                                    style: TextStyle(
                                        color: Color(0xFFFF2D87),
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18 / textScaleFactor),
                                  ),
                                  SizedBox(width: constraints.maxWidth * 0.2),
                                  InkWell(
                                    child: Icon(
                                      Icons.close,
                                      color: HexColor("#627285"),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        _currentOpacity = 0;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(height: height * .01),
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                    constraints.maxWidth * .03, 0, 10, 0),
                                child: Text(
                                  'Ваша скидка и кэшбек действует в сети\nданного магазина. Для индентификации\nВашей личности и активации скидочной карты\nВы можете предъявить код в приложении OX\nAPP. А так же не забывайте что Вы можете\nоплачивать с помощью кода если Вы\nпривязали карту UzCard или Humo к личному\nаккаунту.',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Color(0xFF627285),
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13.5 / textScaleFactor),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(width * .05, height * .04, 0, 0),
              child: Text(
                "Действующие акции",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: "Montserrat",
                  fontSize: 19,
                  color: HexColor("#0D3662"),
                ),
              ),
            ),
            Promotions_List(),
            Tabs_For_Shops(),
            Padding(
              padding: EdgeInsets.fromLTRB(width * .05, height * .05, 0, 0),
              child: Text(
                "Отзывы покупателей",
                style: TextStyle(
                  fontSize: 19,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w600,
                  color: HexColor("#0D3662"),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(22, 0, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  RatingBar.builder(
                    itemSize: 25,
                    initialRating: 0,
                    minRating: 0,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 1),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: HexColor("##FECE2F"),
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
                        color: HexColor("#0D3662")),
                  ),
                ],
              ),
            ),
            Review1(),
            SizedBox(height: height * .03),
            Reviews(),
            SizedBox(height: height * .03),
            Padding(
              padding: EdgeInsets.fromLTRB(26, 10, 0, 14),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        "Популярные товары",
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            fontSize: 19.0,
                            color: HexColor("#000080")),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        "магазина  US POLO ASSN",
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            fontSize: 19.0,
                            color: HexColor("#000080")),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Grid_Hot_Buys(),
            Padding(
              padding: EdgeInsets.fromLTRB(17, 30, 17, 58),
              child: Container(
                width: width,
                height: height / 12,
                child: RaisedButton(
                  elevation: 0.0,
                  child: Text(
                    'ВЕСЬ АССОРТИМЕНТ',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(31),
                  ),
                  padding: const EdgeInsets.all(15),
                  color: HexColor("#FF2D87"),
                  textColor: Colors.white,
                  onPressed: () {},
                ),
              ),
            ),
            Bottom_Sheet(),
          ],
        ),
        GlobalKey());
    return scaffoldWithBottomNavigation;
  }
}
