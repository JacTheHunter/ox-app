import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuckingnum/providers/BrandProvider.dart';
import 'package:fuckingnum/screens/catalog/forgirls/for_girls_grid.dart';
import 'package:fuckingnum/screens/catalog/forgirls/girlsfilter.dart';
import 'package:fuckingnum/screens/catalog/forgirls/list_view_girls.dart';
import 'package:fuckingnum/screens/common/grids/top_best_shops.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../categories.dart';
import 'brand_carousel.dart';

class BrandDetailPage extends StatefulWidget {
  static const routeName = '/brand';

  @override
  _BrandDetailPage createState() => _BrandDetailPage();
}

class _BrandDetailPage extends State<BrandDetailPage> {
  int _selectedCat = 0;
  bool flag = true;

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
                height: height * .5,
                child: ListView.builder(
                  itemCount: categories.length,
                  itemBuilder: (ctx, i) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedCat = i;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(
                            width * .05, height * .01, width * .05, 0),
                        width: width,
                        height: height * .06,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: _selectedCat == i
                              ? HexColor("#EBF1FD")
                              : Colors.white,
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        child: Container(
                          //height: height  * .06,
                          child: Center(
                            child: Text(
                              "Популярные",
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
  Widget build(BuildContext context) {
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    final productId =
        ModalRoute.of(context).settings.arguments as String; // is the id!
    final loadedProduct = Provider.of<BrandProvider>(
      context,
      listen: false,
    ).findById(productId);

    final appBar = AppBar(
      centerTitle: true,
      title: Text(
        "U.S. POLO ASSN.",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontFamily: "Montserrat",
          fontSize: 19 / textScaleFactor,
          color: HexColor('#0D3662'),
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: HexColor("#0D3662"),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.share,
            color: HexColor("#0D3662"),
          ),
          onPressed: () {},
          tooltip: 'Share',
        ),
      ],
    );
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        appBar.preferredSize.height;

    return SafeArea(
      child: Scaffold(
        appBar: appBar,
        backgroundColor: HexColor("#F7F8FB"),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Container(
                    width: width,
                    margin: EdgeInsets.only(
                        top: height * .13,
                        left: width * .04,
                        right: width * .04),
                    child: Wrap(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(29),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.15),
                                blurRadius: 5,
                                offset:
                                    Offset(0, 6), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Card(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(29),
                            ),
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(25),
                                    child: Text(
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                                      overflow:
                                          flag ? TextOverflow.ellipsis : null,
                                      style: TextStyle(
                                        fontSize: 13 / textScaleFactor,
                                        fontFamily: "montserrat",
                                        fontWeight: FontWeight.w400,
                                        color: HexColor("#627285"),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: InkWell(
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.only(
                                                  bottom: height * .01,
                                                  left: width * .07),
                                              child: Text(
                                                flag ? 'читать...' : 'свернуть',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: "Montserrat",
                                                  fontSize:
                                                      12 / textScaleFactor,
                                                  color: HexColor("#0D3662"),
                                                ),
                                              ),
                                            ),
                                          ]),
                                      onTap: () {
                                        setState(() {
                                          flag = !flag;
                                        });
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: height * .02,
                        left: width * 0.16,
                        right: width * .085),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              child: RichText(
                                textAlign: TextAlign.right,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '8439',
                                      style: TextStyle(
                                          color: Color(0xFF0D3662),
                                          fontFamily: 'Montserrat',
                                          fontSize: 12 / textScaleFactor,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    TextSpan(
                                      text: '\nпроданных ед.',
                                      style: TextStyle(
                                          color: Color(0xFF0D3662),
                                          fontFamily: 'Montserrat',
                                          fontSize: 10 / textScaleFactor,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: width * .05),
                            Container(
                              height: height * .13,
                              width: width * .24,
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(loadedProduct.image),
                                    fit: BoxFit.cover),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 3,
                                    blurRadius: 7,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: width * .05),
                            Container(
                              child: RichText(
                                textAlign: TextAlign.left,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '789',
                                      style: TextStyle(
                                          color: Color(0xFF0D3662),
                                          fontFamily: 'Montserrat',
                                          fontSize: 12 / textScaleFactor,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    TextSpan(
                                      text: '\nтоваров в остатке',
                                      style: TextStyle(
                                          color: Color(0xFF0D3662),
                                          fontFamily: 'Montserrat',
                                          fontSize: 10 / textScaleFactor,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * .01),
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
                    color: HexColor("#0D3662"),
                  ),
                ),
              ),
              TopShops(),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    width * .01, height * .05, 0, height * .03),
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
              For_Girls_Grid(),
            ],
          ),
        ),
      ),
    );
  }
}
