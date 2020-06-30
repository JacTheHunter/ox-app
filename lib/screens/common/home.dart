import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuckingnum/screens/cart/cart.dart';
import 'package:fuckingnum/screens/catalog/catalog.dart';
import 'package:fuckingnum/screens/common/searchpage.dart';
import 'package:fuckingnum/screens/feed/feed.dart';
import 'package:fuckingnum/screens/more/more.dart';
import 'package:fuckingnum/screens/qrcode/qrcode.dart';
import 'package:fuckingnum/screens/tabs/brands.dart';
import 'package:fuckingnum/screens/tabs/novelty.dart';
import 'package:fuckingnum/screens/tabs/shops.dart';
import 'package:fuckingnum/transitions/rightslide.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import '../cart/basket-page.dart';
import 'fabbottomappbar.dart';
import 'navigation/navigation.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() {
    return new _HomeState();
  }
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  int _selectedIndexForBottomNavigationBar = 0;
  int _selectedIndexForTabBar = 0;

  ScrollController _scrollViewController;

  final List<Widget> listForBottomNav = [
    FeedPage(),
    CatalogPage(),
    CartPage(),
    Profile(),
  ];

  final List<Widget> listForTabBar = [
    CatalogPage(),
    Brands(),
    Shops(),
    Novelty(),
  ];

  void _onItemTappedForBottomNavigationBar(int index) {
    if (index == 2) {
      Navigator.of(context).push(CupertinoPageRoute(
        builder: (context) {
          return BasketPage();
        },
      ));
    }
    if (index == 0) {
      Navigator.of(context).push(CupertinoPageRoute(
        builder: (context) {
          return FeedPage();
        },
      ));
    }
    setState(() {
      _selectedIndexForBottomNavigationBar = index;
      _selectedIndexForTabBar = 0;
    });
  }

  //4
  void _onItemTappedForTabBar(int index) {
    setState(() {
      _selectedIndexForTabBar = index + 1;
      _selectedIndexForBottomNavigationBar = 0;
    });
  }

  Widget _getAppMainContent(TabBar _tabBar) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
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
                bottom: _tabBar,
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
                        showSearch(context: context, delegate: DataSearch());
                      }),
                  new IconButton(
                      icon: SvgPicture.asset("images/bell.svg"),
                      onPressed: () {}),
                ],
              ),
            ];
          },
          body: Center(
              child: _selectedIndexForTabBar == 0
                  ? listForBottomNav
                      .elementAt(_selectedIndexForBottomNavigationBar)
                  : listForTabBar.elementAt(_selectedIndexForTabBar - 1)),
        ),
      ),
    );
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

    return Scaffold(
      body: _getAppMainContent(tabBar),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Hexcolor("#965EFF"),
          primaryColor: Colors.white,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(31),
            topLeft: Radius.circular(31),
          ),
          child: FABBottomAppBar(
            backgroundColor: Colors.transparent,
            onTabSelected: _onItemTappedForBottomNavigationBar,
            items: [
              FABBottomAppBarItem(svgPic: "icons/lenta.svg", text: 'Лента'),
              FABBottomAppBarItem(svgPic: "icons/store.svg", text: 'Каталог'),
              FABBottomAppBarItem(svgPic: "icons/cart.svg", text: 'Корзина'),
              FABBottomAppBarItem(svgPic: "icons/more.svg", text: 'Ещё'),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.fromLTRB(0, height * .047, 0, 0),
        child: Container(
          width: 68,
          height: 68,
          child: FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: () {
              Navigator.of(context).push(CupertinoPageRoute(
                builder: (context) {
                  return Qr_Code();
                },
              ));
            },
            child: SvgPicture.asset(
              "icons/qrcode2.svg",
              color: Hexcolor("#965EFF"),
              height: 36,
              width: 36,
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(23.0))),
            elevation: 1.0,
          ),
        ),
      ),
    );
  }
}
