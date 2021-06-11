import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fuckingnum/providers/bottom_navigation_provider.dart';
import 'package:fuckingnum/screens/catalog/catalog.dart';
import 'package:fuckingnum/screens/common/searchpage2.dart';
import 'package:fuckingnum/screens/tabs/brands.dart';
import 'package:fuckingnum/screens/tabs/novelty.dart';
import 'package:fuckingnum/screens/tabs/shops.dart';
import 'package:fuckingnum/transitions/leftslide.dart';
import 'package:fuckingnum/transitions/rightslide.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:fuckingnum/screens/feed/feed.dart' as feed;

import 'navigation/navigation.dart';

class CatalogPageWithAppBar extends StatefulWidget {
  @override
  _CatalogPageWithAppBarState createState() => _CatalogPageWithAppBarState();
}

class _CatalogPageWithAppBarState extends State<CatalogPageWithAppBar> {
  int _selectedIndexForTabBar = 0;

  bool _appAppHidden = false;
  List<Widget> listForTabBar = [
    CatalogPage(),
    Brands(),
    Shops(),
    Novelty(),
  ];

  ScrollController _scrollViewController =
      ScrollController(initialScrollOffset: 0);

  void _onItemTappedForTabBar(int index) {
    setState(() {
      _selectedIndexForTabBar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    final tabBar = new TabBar(
      indicatorColor: Hexcolor("#000080"),
      indicatorSize: TabBarIndicatorSize.label,
      isScrollable: true,
      onTap: _onItemTappedForTabBar,
      tabs: <Widget>[
        Tab(
          child: Text(
            "Главная",
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
              fontSize: 14 / textScaleFactor,
              color: Hexcolor("#0D3662"),
            ),
          ),
        ),
        Tab(
          child: Text(
            "Бренды",
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
              fontSize: 14 / textScaleFactor,
              color: Hexcolor("#0D3662"),
            ),
          ),
        ),
        Tab(
          child: Text(
            "Магазины",
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
              fontSize: 14 / textScaleFactor,
              color: Hexcolor("#0D3662"),
            ),
          ),
        ),
        Tab(
          child: Text(
            "Новинки",
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
              fontSize: 14 / textScaleFactor,
              color: Hexcolor("#0D3662"),
            ),
          ),
        ),
      ],
    );

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: Consumer<BottomNavigationProvider>(
          builder: (BuildContext context, BottomNavigationProvider value,
              Widget child) {
            if (value.scrolling && !this._appAppHidden) {
              _scrollViewController
                  .animateTo(100,
                      duration: Duration(milliseconds: 400),
                      curve: Curves.linear)
                  .whenComplete(() {
                this._appAppHidden = true;
              });
            } else if (!value.scrolling && this._appAppHidden) {
              _scrollViewController
                  .animateTo(0,
                      duration: Duration(milliseconds: 400),
                      curve: Curves.linear)
                  .whenComplete(() {
                this._appAppHidden = false;
              });
            }

            return new NestedScrollView(
              controller: _scrollViewController,
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  new SliverAppBar(
                    title: SvgPicture.asset("icons/logo.svg"),
                    leading: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          new SlideLeftRoute(page: NavigationDrawer()),
                        );
                      },
                      icon: SvgPicture.asset("icons/menu.svg"),
                    ),
                    bottom: tabBar,
                    pinned: true,
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
                            Navigator.push(
                                context, SlideRightRoute(widget: SearchPage()));
                          }),
                      new IconButton(
                          icon: SvgPicture.asset("images/bell.svg"),
                          onPressed: () {}),
                    ],
                  ),
                ];
              },
              body: listForTabBar[_selectedIndexForTabBar],
            );
          },
        ),
      ),
    );
  }
}
