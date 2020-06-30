import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:fuckingnum/screens/product_detail_page/product_detail_page.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Grid_Girls_Item extends StatelessWidget {
  final String image;

  Grid_Girls_Item(this.image);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                new CupertinoPageRoute(
                    builder: (context) => new ProductPage()));
          },
          child: Container(
            padding: EdgeInsets.all(10.0),
            width: MediaQuery.of(context).size.width / 2.1,
            height: MediaQuery.of(context).size.height / 2.7,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: new Stack(
                children: <Widget>[
                  Carousel(
                    boxFit: BoxFit.cover,
                    images: [
                      AssetImage(image),
                      AssetImage(image),
                      AssetImage(image),
                      AssetImage(image),
                    ],
                    autoplay: false,
                    dotSize: 3.0,
                    dotSpacing: 10.0,
                    dotBgColor: Colors.transparent,
                    dotColor: Colors.white,
                    indicatorBgPadding: 9.0,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        width * .33, height * .01, 0, height * .01),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        InkWell(
                          onTap: () {},
                          child: ClipOval(
                            child: Container(
                              color: Colors.white,
                              height: height * .04, // height of the button
                              width: width * .08, // width of the button
                              child: Center(
                                child: SvgPicture.asset("icons/heart.svg"),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: ClipOval(
                            child: Container(
                              color: Colors.white,
                              height: height * .04, // height of the button
                              width: width * .08, // with of the button
                              child: Center(
                                child: SvgPicture.asset("icons/basket.svg"),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(width * .025, 0, 0, 0),
          child: Text(
            "Платье женское для",
            style: TextStyle(
                fontSize: 11 / textScaleFactor,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
                color: Hexcolor("#627285")),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(width * .025, 0, 0, 0),
          child: Text(
            "5 500 000",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontFamily: 'Montserrat',
              fontSize: 14 / textScaleFactor,
              color: Hexcolor('#0D3662'),
            ),
          ),
        ),
      ],
    );
  }
}
