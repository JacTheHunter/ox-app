import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:fuckingnum/providers/bottom_navigation_provider.dart';
import 'package:fuckingnum/screens/cart/cart-warapper.dart';
import 'package:fuckingnum/screens/catalog/catalog.dart';
import 'package:fuckingnum/screens/common/fabbottomappbar.dart';
import 'package:fuckingnum/screens/common/feed-page-with-appbar.dart';
import 'package:fuckingnum/screens/feed/feed.dart';
import 'package:fuckingnum/screens/more/more.dart';
import 'package:provider/provider.dart';

class ScaffoldWithBottomNavigation extends StatefulWidget {
  Widget _body;

  AppBar _appBar;

  AppBar get appBar => _appBar;

  set appBar(AppBar value) {
    _appBar = value;
  }

  Widget get body => _body;

  set body(Widget value) {
    _body = value;
  }

  @override
  _ScaffoldWithBottomNavigationState createState() =>
      _ScaffoldWithBottomNavigationState();
}

class _ScaffoldWithBottomNavigationState
    extends State<ScaffoldWithBottomNavigation> {
  bool _bottomNavigationHidden = false;
  double _bottom_Bar_Y = 1;
  bool isKeyboardVisible = false;
  Widget _activeWidget;
  Widget _appBar;

  final List<Widget> listForBottomNav = [
    FeedPage(),
    CatalogPageWithAppBar(),
    CartWrapper(),
    Profile(),
  ];

  void _onItemTappedForBottomNavigationBar(int index) {
    if (index == 2) {
      Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => CartWrapper(),
          ));
      return;
    }
    setState(() {
      _appBar = null;
      _activeWidget = listForBottomNav[index];
    });
  }

  @override
  void initState() {
    super.initState();
    _appBar = widget.appBar;
    KeyboardVisibility.onChange.listen((bool visible) {
      if (mounted) {
        this.isKeyboardVisible = visible;
      }
    });
    _activeWidget = widget.body;
    Provider.of<BottomNavigationTabIndexProvider>(context, listen: false)
        .addListener(() {
      if (Provider.of<BottomNavigationTabIndexProvider>(context, listen: false)
              .tabIndex !=
          null) {
        _onItemTappedForBottomNavigationBar(
            Provider.of<BottomNavigationTabIndexProvider>(context,
                    listen: false)
                .tabIndex);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      appBar: _appBar != null
          ? _appBar
          : PreferredSize(child: Container(), preferredSize: Size(0, 0)),
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: width,
              height: height,
              child: _activeWidget,
            ),
          ),
          this.isKeyboardVisible
              ? SizedBox.shrink()
              : Consumer<BottomNavigationProvider>(
                  builder: (BuildContext context,
                      BottomNavigationProvider value, Widget child) {
                    if (value.scrolling) {
                      if (!this._bottomNavigationHidden) {
                        this._bottom_Bar_Y = 1.5;
                      } else {
                        this._bottomNavigationHidden = true;
                      }
                    } else {
                      if (!this._bottomNavigationHidden) {
                        this._bottom_Bar_Y = 1;
                      } else {
                        this._bottomNavigationHidden = false;
                      }
                    }

                    return AnimatedAlign(
                      alignment: Alignment(0, this._bottom_Bar_Y),
                      duration: Duration(milliseconds: 500),
                      child: Container(
                        width: width,
                        height: height * .13,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(31),
                            topLeft: Radius.circular(31),
                          ),
                        ),
                        child: FABBottomAppBar(
                          backgroundColor: Colors.transparent,
                          onTabSelected: _onItemTappedForBottomNavigationBar,
                          items: [
                            FABBottomAppBarItem(
                                svgPic: "icons/lenta.svg", text: 'Лента'),
                            FABBottomAppBarItem(
                                svgPic: "icons/store.svg", text: 'Каталог'),
                            FABBottomAppBarItem(
                                svgPic: "icons/cart.svg", text: 'Корзина'),
                            FABBottomAppBarItem(
                                svgPic: "icons/more.svg", text: 'Ещё'),
                          ],
                        ),
                      ),
                    );
                  },
                )
        ],
      ),
    );
  }
}
