import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuckingnum/utils/bottom-navigation-bar-utils.dart';
import 'package:fuckingnum/utils/ox-scrol-view.dart';
import 'package:hexcolor/hexcolor.dart';
import 'bottomsheet_feed.dart';
import 'feed_image_carousel.dart';
import 'grid_for_feed.dart';
import 'list_view_for_stories.dart';

class FeedPage extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    var scaffoldWithBottomNavigation = ScaffoldWithBottomNavigation();
    scaffoldWithBottomNavigation.body = OxScrollView(
        ScrollController(),
         Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: width,
                  height: height * .17,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: list_view_for_stories(),
                ),
              ],
            ),
            Feed_Image_Carousel(),
            Padding(
              padding: EdgeInsets.fromLTRB(width * .05, height * .03, 0, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Мои магазины",
                    style: TextStyle(
                        color: Hexcolor("#0D3662"),
                        fontWeight: FontWeight.w600,
                        fontFamily: "Montserrat",
                        fontSize: 16 / textScaleFactor),
                  ),
                ],
              ),
            ),
            GridFor_Feed(),
            SizedBox(height: height * .04),
            bottomSheetFeed(),
          ],
        ),
        GlobalKey());
    return scaffoldWithBottomNavigation;
//    return Scaffold(
//      backgroundColor: Hexcolor("#EBEFF9"),
//      body: SingleChildScrollView(
//        child: ,
//      ),
//    );
  }
}
