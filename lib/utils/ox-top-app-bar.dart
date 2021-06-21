import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fuckingnum/screens/common/navigation/navigation.dart';
import 'package:fuckingnum/screens/common/searchpage2.dart';
import 'package:fuckingnum/transitions/leftslide.dart';
import 'package:fuckingnum/transitions/rightslide.dart';
import 'package:hexcolor/hexcolor.dart';

class OxTopAppBarWithBody extends StatelessWidget {
  Widget body;
  ScrollController _scrollController;

  OxTopAppBarWithBody(this.body, this._scrollController);

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      controller: _scrollController,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          new SliverAppBar(
            title: SvgPicture.asset("icons/logo.svg"),
            leading: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  SlideLeftRoute(page: NavigationDrawer()),
                );
              },
              icon: SvgPicture.asset("icons/menu.svg"),
            ),
            pinned: false,
            floating: true,
            forceElevated: innerBoxIsScrolled,
            iconTheme: new IconThemeData(color: HexColor('#000080')),
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
                  icon: SvgPicture.asset("images/bell.svg"), onPressed: () {}),
            ],
          ),
        ];
      },
      body: body,
    );
  }
}
