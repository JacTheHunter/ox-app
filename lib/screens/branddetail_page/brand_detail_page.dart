import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuckingnum/screens/catalog/forgirls/for_girls_grid.dart';
import 'package:fuckingnum/screens/catalog/forgirls/girlsfilter.dart';
import 'package:fuckingnum/screens/catalog/forgirls/list_view_girls.dart';
import 'package:fuckingnum/screens/common/grids/top_best_shops.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../categories.dart';
import 'brand_carousel.dart';

class BrandDetailPage extends StatefulWidget {
  @override
  _BrandDetailPage createState() => _BrandDetailPage();
}

class _BrandDetailPage extends State<BrandDetailPage> {
  int _selectedCat = 0;

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
      backgroundColor: Hexcolor("#F7F8FB"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              overflow: Overflow.visible,
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  child: AppBar(
                    centerTitle: true,
                    title: Text(
                      "U.S. POLO ASSN.",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: "Montserrat",
                        fontSize: 19 / textScaleFactor,
                        color: Hexcolor('#0D3662'),
                      ),
                    ),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    leading: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Hexcolor("#0D3662"),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    actions: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.share,
                          color: Hexcolor("#0D3662"),
                        ),
                        onPressed: () {},
                        tooltip: 'Share',
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Brand_Carousel(),
            List_View_Girls(),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  width * .045, height * .03, 0, height * .03),
              child: Text(
                "Магазины",
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 19 / textScaleFactor,
                  fontWeight: FontWeight.w600,
                  color: Hexcolor("#0D3662"),
                ),
              ),
            ),
            TopShops(),
            Padding(
              padding: EdgeInsets.fromLTRB(width * .01, height * .05, 0, 0),
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
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
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
            For_Girls_Grid(),
          ],
        ),
      ),
    );
  }
}
