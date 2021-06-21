import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuckingnum/screens/catalog/more_button.dart';
import 'package:fuckingnum/screens/common/grids/grid.dart';
import 'package:fuckingnum/screens/common/navigation/navigation.dart';
import 'package:fuckingnum/screens/models/grid_brand_constructor.dart';
import 'package:fuckingnum/screens/shopingpage/list_of_products.dart';
import 'package:fuckingnum/utils/bottom-navigation-bar-utils.dart';
import 'package:fuckingnum/utils/ox-scrol-view.dart';
import 'package:fuckingnum/utils/ox-top-app-bar.dart';
import '../../../girls_categories.dart';
import 'package:fuckingnum/transitions/scale_transition.dart';
import 'package:hexcolor/hexcolor.dart';
import '../catalog_carousel.dart';
import 'list_view_girls.dart';
import 'for_girls_grid.dart';
import 'girls_carousel.dart';
import 'girlsfilter.dart';

class Girls_Clothes extends StatefulWidget {
  @override
  _Girls_Clothes createState() => _Girls_Clothes();
}

class _Girls_Clothes extends State<Girls_Clothes> {
  final List<GridConstructor> grid = [
    GridConstructor(image: 'images/girl1.jpg'),
    GridConstructor(image: 'images/girl2.jpg'),
    GridConstructor(image: 'images/girl3.jpg'),
    GridConstructor(image: 'images/girl4.jpg'),
    GridConstructor(image: 'images/girl5.jpg'),
    GridConstructor(image: 'images/girl6.jpg'),
    GridConstructor(image: 'images/girl7.jpg'),
    GridConstructor(image: 'images/girl8.jpg'),
    GridConstructor(image: 'images/girl9.jpg'),
  ];
  int _selectedCat = 0;
  double _currentOpacity1 = 1;
  double _currentOpacity2 = 1;

  ScrollController _scrollViewController;
  ScrollController _contentScrollController;

  void _settingModalBottomSheet(context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(29), topLeft: Radius.circular(29.0)),
      ),
      builder: (BuildContext bc) {
        return StatefulBuilder(
          builder: (BuildContext context, setState) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, height * .01),
                child: Container(
                  width: width * .1,
                  height: height * .01,
                  decoration: BoxDecoration(
                      color: HexColor("#8A96AD"),
                      borderRadius: BorderRadius.circular(4.5)),
                ),
              ),
              Container(
                width: width,
                height: height / 2,
                child: ListView.builder(
                  itemCount: girls_categories.length,
                  itemBuilder: (ctx, i) {
                    return GestureDetector(
                      onTap: () {
                        setState(
                              () {
                            _selectedCat = i;
                          },
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(
                            width * .05, height * .01, width * .05, 0),
                        width: width,
                        height: 45,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: _selectedCat == i
                              ? HexColor("#EBF1FD")
                              : Colors.white,
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        child: Container(
                          width: 295,
                          height: 45,
                          child: Center(
                            child: Text(
                              girls_categories[i].title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16 / textScaleFactor,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w400,
                                  color: HexColor("#0D3662")),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _contentScrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    var scaffoldWithBottomNavigation = ScaffoldWithBottomNavigation();
    scaffoldWithBottomNavigation.body = OxTopAppBarWithBody(
        OxScrollView(
            _contentScrollController,
            Column(
              children: <Widget>[
                FlatButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.arrow_back_ios,
                        size: 12,
                        color: Colors.pink,
                      ),
                      SizedBox(width: width * .01),
                      Text(
                        "Одежда, обувь и аксессуары",
                        style: TextStyle(
                            fontSize: 14 / textScaleFactor,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                            color: HexColor("#FF2D87")),
                      ),
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(
                        context, ScaleRoute(page: NavigationDrawer()));
                  },
                ),
                Text(
                  "Женская одежда",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Montserrat',
                      fontSize: 28 / textScaleFactor,
                      color: HexColor("#0D3662")),
                ),
                Text(
                  "789 товаров",
                  style: TextStyle(
                    fontSize: 12 / textScaleFactor,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    color: HexColor("#0D3662"),
                  ),
                ),
                new List_View_Girls(),
                new SizedBox(height: height * .03),
                new SvgPicture.asset("images/minibanner1.svg", width: width),
                new Padding(
                  padding: EdgeInsets.fromLTRB(
                      width * .05, height * .025, 0, height * .025),
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Text(
                        "Ваши любимые бренды!",
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            fontSize: 19.0 / textScaleFactor,
                            color: HexColor("#000080")),
                      ),
                    ],
                  ),
                ),
                new Grid_For_Brands(),
                new More_Button(),
                new SizedBox(height: height * .01),
                new Carousel_Guess(),
                new Padding(
                  padding: EdgeInsets.fromLTRB(
                      width * .055, height * .06, 0, height * .01),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "До -70% на спортивную",
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                                fontSize: 19.0 / textScaleFactor,
                                color: HexColor("#0D3662")),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "одежду и обувь",
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                                fontSize: 19.0 / textScaleFactor,
                                color: HexColor("#0D3662")),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                new Grid_For_Brands(),
                new Padding(
                  padding: EdgeInsets.fromLTRB(
                      width * .055, height * .01, 0, height * .08),
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Text(
                        "Еще больше скидки",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                            fontSize: 12.0 / textScaleFactor,
                            color: HexColor("#0D3662")),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(width * .01, 0, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "Все товары",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Montserrat',
                          fontSize: 14 / textScaleFactor,
                          color: HexColor("#0D3662"),
                        ),
                      ),
                      Container(
                        height: height * .06,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          shape: BoxShape.rectangle,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 5),
                              spreadRadius: 1,
                              blurRadius: 7,
                              color: Colors.grey.withOpacity(0.3),
                            ),
                          ],
                        ),
                        child: RaisedButton.icon(
                          elevation: 0,
                          onPressed: () {
                            _settingModalBottomSheet(context);
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                          label: Text(
                            'Популярные',
                            style: TextStyle(
                              color: HexColor("#0D3662"),
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Montserrat',
                              fontSize: 12 / textScaleFactor,
                            ),
                          ),
                          icon: SvgPicture.asset('icons/sortingarrow.svg'),
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        width: width * .11,
                        height: height * .06,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 5),
                              spreadRadius: 1,
                              blurRadius: 7,
                              color: Colors.grey.withOpacity(0.3),
                            ),
                          ],
                        ),
                        child: Center(
                          child: SvgPicture.asset('icons/union.svg'),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            new CupertinoPageRoute(
                                builder: (context) => new Filter()),
                          );
                        },
                        child: Container(
                          width: width * .11,
                          height: height * .06,
                          decoration: BoxDecoration(
                              color: HexColor("#0D3662"),
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Center(
                            child: SvgPicture.asset('icons/filter.svg'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(width * .05, height * .02, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      StatefulBuilder(
                        builder: (BuildContext ctx, StateSetter setState) =>
                            AnimatedOpacity(
                              opacity: _currentOpacity1,
                              duration: Duration(milliseconds: 300),
                              child: _currentOpacity1 == 0
                                  ? SizedBox()
                                  : RaisedButton(
                                elevation: 0,
                                onPressed: () {
                                  setState(() {
                                    _currentOpacity1 = 0;
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(15.0))),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      'Цена',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Montserrat',
                                        fontSize: 12 / textScaleFactor,
                                      ),
                                    ),
                                    SizedBox(width: width * .02),
                                    SvgPicture.asset('icons/close.svg'),
                                  ],
                                ),
                                color: HexColor("#965EFF"),
                              ),
                            ),
                      ),
                      SizedBox(width: width * .03),
                      StatefulBuilder(
                        builder: (BuildContext ctx, StateSetter setState) =>
                            AnimatedOpacity(
                              opacity: _currentOpacity2,
                              duration: Duration(milliseconds: 300),
                              child: _currentOpacity2 == 0
                                  ? SizedBox()
                                  : RaisedButton(
                                elevation: 0,
                                onPressed: () {
                                  setState(
                                        () {
                                      _currentOpacity2 = 0;
                                    },
                                  );
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(15.0))),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      'Коллекция',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Montserrat',
                                        fontSize: 12 / textScaleFactor,
                                      ),
                                    ),
                                    SizedBox(width: width * .02),
                                    SvgPicture.asset('icons/close.svg'),
                                  ],
                                ),
                                color: HexColor("#965EFF"),
                              ),
                            ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * .01),
                List_Of_Products(),
                Padding(
                  padding: EdgeInsets.fromLTRB(width * .025, 0, width * .025, 0),
                  child: Girls_Carousel(),
                ),
                For_Girls_Grid(),
              ],
            ),
            GlobalKey()),
        _scrollViewController);
    return scaffoldWithBottomNavigation;
  }
}
