import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fuckingnum/providers/bottom_navigation_provider.dart';
import 'package:fuckingnum/screens/common/grids/grid.dart';
import 'package:fuckingnum/screens/common/grids/top_best_shops.dart';
import 'package:fuckingnum/screens/common/navigation/navigation.dart';
import 'package:fuckingnum/transitions/leftslide.dart';
import 'package:fuckingnum/utils/ox-scrol-view.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'bottom_button.dart';
import 'grid_cards_layout.dart';
import 'catalog_carousel.dart';
import 'product_banner.dart';
import 'grid_hot_buys.dart';
import 'more_button.dart';

class CatalogPage extends StatefulWidget {
  bool withTopAppBarNavigation;

  CatalogPage({this.withTopAppBarNavigation = true});

  @override
  _CatalogPage createState() => _CatalogPage();
}

class _CatalogPage extends State<CatalogPage> {
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      Provider.of<BottomNavigationProvider>(context, listen: false)
          .scrollBegin();
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return OxScrollView(
        _scrollController,
        Column(
          children: <Widget>[
            new Grid_Cards_Layout(),
            Padding(
              padding: EdgeInsets.only(top: height * .035 , bottom: height * .02),
              child: new Container(
                //margin: EdgeInsets.fromLTRB(
                //    width * .15, height * .025, width * .15, 0),
                height: height * .065,
                width: width * .65,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(60),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 7,
                      blurRadius: 15,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(60.0))),
                  onPressed: () {
                    Navigator.push(
                      context,
                      SlideLeftRoute(page: NavigationDrawer()),
                    );
                  },
                  elevation: 0,
                  textColor: Colors.white,
                  color: Colors.white,
                  padding: EdgeInsets.fromLTRB(width * .05, 0, 0, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(width * .01, height * .01,
                            width * .01, height * .01),
                        child: Text(
                          'ВСЯ КАТЕГОРИЯ ТОВАРОВ',
                          style: TextStyle(
                              color: HexColor("#000080"),
                              fontSize: 14.0 / textScaleFactor,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            width * .01, 0, width * .01, 0),
                        child: SvgPicture.asset("icons/menu1.svg"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            new SizedBox(height: height * .02),
            new Image.asset("images/minibanner.jpg", width: width),
            new Padding(
              padding: EdgeInsets.all(height * .027),
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Ваши любимые бренды!",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      fontSize: 19.0 / textScaleFactor,
                      color: HexColor("#000080"),
                    ),
                  ),
                ],
              ),
            ),
            new Grid_For_Brands(),
            new More_Button(),
            new SizedBox(height: height * .01),
            new Carousel_Guess(),
            new SizedBox(height: height * .01),
            new Product_Banner(),
            new Padding(
              padding: EdgeInsets.fromLTRB(
                  width * .045, height * .01, width * .045, height * .01),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text(
                    "Weather textured",
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        fontSize: 19.0 / textScaleFactor,
                        color: HexColor("#000080")),
                  ),
                  SizedBox(height: height * .01),
                  new Text(
                    "Under is the new outer",
                    style: TextStyle(
                      color: HexColor("#0E3763"),
                      fontFamily: 'Montserrat',
                      fontSize: 16.0 / textScaleFactor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            new Product_Banner(),
            SizedBox(height: height * .01),
            new Padding(
              padding: EdgeInsets.fromLTRB(
                  width * .045, height * .01, width * .045, height * .045),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text(
                    "Pink Vibes Collection",
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        fontSize: 19.0 / textScaleFactor,
                        color: HexColor("#000080")),
                  ),
                  new Text(
                    "Never Enough Layers",
                    style: TextStyle(
                      color: HexColor("#0E3763"),
                      fontFamily: 'Montserrat',
                      fontSize: 16.0 / textScaleFactor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * .01),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  width * .06, height * .01, 0, height * .02),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        "Горячее предложение",
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            fontSize: 19.0 / textScaleFactor,
                            color: HexColor("#000080")),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        "ЛЕТО 2020",
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            fontSize: 19.0 / textScaleFactor,
                            color: HexColor("#000080")),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            new Grid_Hot_Buys(),
            new Padding(
              padding: EdgeInsets.fromLTRB(
                  width * .05, height * .02, 0, height * .04),
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Stack(
                    children: <Widget>[
                      Text(
                        "Ещё больше скидки",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          fontSize: 15.0 / textScaleFactor,
                          color: HexColor("#000080"),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, height * .013, 0, 0),
                        child: Container(
                          width: width * .4,
                          height: height * .01,
                          color: HexColor("#965EFF").withOpacity(0.2),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            new SizedBox(height: height * .01),
            new Padding(
              padding: EdgeInsets.fromLTRB(
                  width * .045, height * .045, width * .045, height * .045),
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "ТОП Лучших магазинов",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      fontSize: 19.0 / textScaleFactor,
                      color: HexColor("#000080"),
                    ),
                  ),
                ],
              ),
            ),
            new TopShops(),
            new More_Button(),
            new BottomButton(),
            SizedBox(height: height * .07),
          ],
        ),
        GlobalKey());
  }
}
