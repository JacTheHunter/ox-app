import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fuckingnum/providers/ShopProvider.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class Shopping_Image extends StatefulWidget {
  @override
  _Shopping_Image createState() => _Shopping_Image();
}

class _Shopping_Image extends State<Shopping_Image> {
  bool _tapped = false;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;
    final productId =
    ModalRoute.of(context).settings.arguments as String; // is the id!
    final loadedProduct = Provider.of<ShopProvider>(
      context,
      listen: false,
    ).findById(productId);

    return Container(
      width: width,
      height: height * 0.45,
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Container(
              child: Image.asset(
                'icons/polo1.jpg',
                width: width,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: height * .17,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "7 тысч.",
                        textScaleFactor: 1,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Montserrat',
                            fontSize: 18,
                            color: Colors.white),
                      ),
                      SizedBox(height: height * .01),
                      Text(
                        "Подписчики",
                        textScaleFactor: 1,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Montserrat',
                            fontSize: 12,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(width: width * .06),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: width * 0.26,
                        height: height * 0.13,
                     //   padding: EdgeInsets.all(51),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage(loadedProduct.image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: height * .01),
                      RatingBar(
                        itemSize: 16.5,
                        initialRating: 0,
                        minRating: 0,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 1),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Hexcolor("##FECE2F"),
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                    ],
                  ),
                  SizedBox(width: width * .06),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "74 тысч.",
                        textScaleFactor: 1,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Montserrat',
                            fontSize: 18,
                            color: Colors.white),
                      ),
                      SizedBox(height: height * .01),
                      Text(
                        "Товаров",
                        textScaleFactor: 1,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Montserrat',
                            fontSize: 12,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, 1.15),
            child: Container(
              width: width,
              height: height * .05,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _tapped = !_tapped;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                          left: width * .03, right: width * .04),
                      height: height * .06,
                      decoration: BoxDecoration(
                          color: Hexcolor("#2F80ED"),
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Center(
                        child: Text(
                          _tapped ? "Подписан" : "+ Подписаться",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0 / textScaleFactor,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      UrlLauncher.launch('sms:+998 99 666 66 66');
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                          left: width * .065, right: width * .065),
                      height: height * .055,
                      decoration: BoxDecoration(
                          color: Hexcolor("#627285"),
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Center(
                        child: Text(
                          "Сообщение",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0 / textScaleFactor,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      UrlLauncher.launch('tel:+998 99 666 66 66');
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      height: height * .055,
                      width: height * .055,
                      decoration: BoxDecoration(
                          color: Hexcolor("#627285"),
                          borderRadius: BorderRadius.circular(height * .055)),
                      child: Center(child: SvgPicture.asset('icons/phone.svg')),
                    ),
                  ),
                ],
              ),
            ),
          ),

          //Positioned(
          //  top: height * .35,
          //  // bottom: height * .2,
          //  child: Row(
          //    children: <Widget>[
          //      SizedBox(width: width / 20),
          //      RaisedButton(
          //        color: Hexcolor("#2F80ED"),
          //        onPressed: () {},
          //        shape: RoundedRectangleBorder(
          //          borderRadius: BorderRadius.circular(18.0),
          //        ),
          //        child: Text(
          //          "+ Подписаться",
          //          style: TextStyle(
          //              fontSize: 14,
          //              fontFamily: "Montserrat",
          //              fontWeight: FontWeight.w500,
          //              color: Colors.white),
          //        ),
          //      ),
          //      SizedBox(width: width / 40),
          //      RaisedButton(
          //        color: Hexcolor("#627285"),
          //        onPressed: () {},
          //        shape: RoundedRectangleBorder(
          //          borderRadius: BorderRadius.circular(18.0),
          //        ),
          //        child: Text(
          //          "   Сообщение   ",
          //          style: TextStyle(
          //              fontSize: 14,
          //              fontFamily: "Montserrat",
          //              fontWeight: FontWeight.w500,
          //              color: Colors.white),
          //        ),
          //      ),
          //      RawMaterialButton(
          //        onPressed: () {},
          //        fillColor: Hexcolor("#627285"),
          //        child: SvgPicture.asset('icons/phone.svg'),
          //        shape: CircleBorder(),
          //      ),
          //    ],
          //  ),
          //),
        ],
      ),
    );
  }
}
