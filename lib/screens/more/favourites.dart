import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Favourites extends StatefulWidget {
  @override
  _Favourites createState() => _Favourites();
}

class _Favourites extends State<Favourites> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Hexcolor("#F7F8FB"),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor:Hexcolor("#F7F8FB"),
          leading:  IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Hexcolor("#0D3662"),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          centerTitle: true,
          title: Text(
            'Избранные',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 20 / textScaleFactor,
              fontWeight: FontWeight.w600,
              color: Color(0xFF0D3662),
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: height / 1.7,
              width: width / 1.5,
              //margin: EdgeInsets.only(left: width / 10000),
              child: Image.asset(
                'images/wishlist.png',
                fit: BoxFit.contain,
                alignment: Alignment.center,
              ),
            ),
            SizedBox(height: height / 30),
            Container(
              alignment: Alignment.center,
              child: Text(
                'У вас нету \n избранных товаров',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 24 / textScaleFactor,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF0D3662),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
