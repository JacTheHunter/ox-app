import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuckingnum/screens/catalog/more_button.dart';
import 'package:fuckingnum/screens/common/grids/grid.dart';
import 'package:fuckingnum/screens/common/navigation/navigation.dart';
import 'package:fuckingnum/screens/common/searchpage.dart';
import 'package:fuckingnum/screens/common/searchpage2.dart';
import 'package:fuckingnum/transitions/rightslide.dart';
import 'package:fuckingnum/transitions/scale_transition.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../categories.dart';
import '../../models/grid_brand_constructor.dart';
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
  final List<Grid_Constructor> grid = [
    Grid_Constructor(image: 'icons/beatygirl.jpg'),
    Grid_Constructor(image: 'icons/beatygirl.jpg'),
    Grid_Constructor(image: 'icons/beatygirl.jpg'),
    Grid_Constructor(image: 'icons/beatygirl.jpg'),
    Grid_Constructor(image: 'icons/beatygirl.jpg'),
    Grid_Constructor(image: 'icons/beatygirl.jpg'),
    Grid_Constructor(image: 'icons/beatygirl.jpg'),
    Grid_Constructor(image: 'icons/beatygirl.jpg'),
    Grid_Constructor(image: 'icons/beatygirl.jpg'),
    Grid_Constructor(image: 'icons/beatygirl.jpg'),
    Grid_Constructor(image: 'icons/beatygirl.jpg'),
    Grid_Constructor(image: 'icons/beatygirl.jpg'),
  ];
  int _selectedCat = 0;

  ScrollController _scrollViewController;

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
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, height * .01),
              child: Container(
                width: width * .1,
                height: height * .01,
                decoration: BoxDecoration(
                    color: Hexcolor("#8A96AD"),
                    borderRadius: BorderRadius.circular(4.5)),
              ),
            ),
            Container(
              width: width,
              height: height / 2,
              child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (ctx, i) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        _selectedCat = i;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(
                          width * .05, height * .01, width * .05, 0),
                      width: width,
                      height: 45,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: _selectedCat == i
                            ? Hexcolor("#EBF1FD")
                            : Colors.white,
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      child: Container(
                        width: 295,
                        height: 45,
                        child: Center(
                          child: Text(
                            "Популярные",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16 / textScaleFactor,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w400,
                                color: Hexcolor("#0D3662")),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      body: new NestedScrollView(
        controller: _scrollViewController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            new SliverAppBar(
              title: SvgPicture.asset("icons/logo.svg"),
              leading: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    SlideRightRoute(page: NavigationDrawer()),
                  );
                },
                icon: SvgPicture.asset("icons/menu.svg"),
              ),
              pinned: false,
              floating: true,
              forceElevated: innerBoxIsScrolled,
              iconTheme: new IconThemeData(color: Hexcolor('#000080')),
              backgroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
              actions: <Widget>[
                new IconButton(
                    icon: SvgPicture.asset("icons/search.svg"),
                    onPressed: () {
                      Navigator.push(context, ScaleRoute(page: SearchPage()));
                    }),
                new IconButton(
                    icon: SvgPicture.asset("images/bell.svg"),
                    onPressed: () {}),
              ],
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              FlatButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SvgPicture.asset("icons/arrowleft.svg"),
                    SizedBox(width: width * .01),
                    Text(
                      "Одежда, обувь и аксессуары",
                      style: TextStyle(
                          fontSize: 14 / textScaleFactor,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          color: Hexcolor("#FF2D87")),
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.push(context, ScaleRoute(page: NavigationDrawer()));
                },
              ),
              Text(
                "Женская одежда",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Montserrat',
                    fontSize: 28 / textScaleFactor,
                    color: Hexcolor("#0D3662")),
              ),
              Text(
                "789 товаров",
                style: TextStyle(
                  fontSize: 12 / textScaleFactor,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  color: Hexcolor("#0D3662"),
                ),
              ),
              new List_View_Girls(),
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
                          color: Hexcolor("#000080")),
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
                              color: Hexcolor("#0D3662")),
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
                              color: Hexcolor("#0D3662")),
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
                          color: Hexcolor("#0D3662")),
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
                        color: Hexcolor("#0D3662"),
                      ),
                    ),
                    RaisedButton.icon(
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
                          color: Hexcolor("#0D3662"),
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Montserrat',
                          fontSize: 12 / textScaleFactor,
                        ),
                      ),
                      icon: SvgPicture.asset('icons/sortingarrow.svg'),
                      color: Colors.white,
                    ),
                    Container(
                      width: width * .11,
                      height: height * .06,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Center(
                        child: SvgPicture.asset('icons/union.svg'),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          new CupertinoPageRoute(
                              builder: (context) => new filter()),
                        );
                      },
                      child: Container(
                        width: width * .11,
                        height: height * .06,
                        decoration: BoxDecoration(
                            color: Hexcolor("#0D3662"),
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
                padding: EdgeInsets.fromLTRB(width * .05, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    RaisedButton.icon(
                      elevation: 0,
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      icon: SvgPicture.asset('icons/close.svg'),
                      label: Text(
                        'Цена',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Montserrat',
                          fontSize: 12 / textScaleFactor,
                        ),
                      ),
                      color: Hexcolor("#965EFF"),
                    ),
                    SizedBox(width: width * .03),
                    RaisedButton.icon(
                      elevation: 0,
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      label: Text(
                        'Коллекция',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Montserrat',
                          fontSize: 12 / textScaleFactor,
                        ),
                      ),
                      icon: SvgPicture.asset('icons/close.svg'),
                      color: Hexcolor("#965EFF"),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * .01),
              Padding(
                padding: EdgeInsets.fromLTRB(width * .025, 0, width * .025, 0),
                child: Girls_Carousel(),
              ),
              For_Girls_Grid(),
            ],
          ),
        ),
      ),
    );
  }
}
