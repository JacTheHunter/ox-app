import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuckingnum/screens/catalog/catalog.dart';
import 'package:fuckingnum/screens/common/feed-page-with-appbar.dart';
import 'package:fuckingnum/utils/bottom-navigation-bar-utils.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() {
    return new _HomeState();
  }
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var scaffoldWithBottomNavigation = ScaffoldWithBottomNavigation();
    scaffoldWithBottomNavigation.body = CatalogPageWithAppBar();
    return scaffoldWithBottomNavigation;
  }
}
