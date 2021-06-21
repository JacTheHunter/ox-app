import 'package:flutter/material.dart';
import 'package:fuckingnum/screens/catalog/forgirls/girls_clothes.dart';
import 'package:fuckingnum/transitions/rightslide.dart';
import 'package:hexcolor/hexcolor.dart';

class SubSubItem extends StatelessWidget {
  int _selectedCat = 0;

  final String image;
  final String title;

  SubSubItem(this.image, this.title);

  @override
  Widget build(BuildContext context) {
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, height * .01),
      child: FlatButton(
        onPressed: () {
          Navigator.push(
            context,
            SlideRightRoute(widget: Girls_Clothes()),
          );
        },
        child: Container(
          height: height * .07,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(width  * .02, height  *.01, width  * .02, height * .01),
                child: Container(
                  width: width * .09,
                  height: height * .05,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.asset(image, fit: BoxFit.cover),
                  ),
                ),
              ),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Montserrat',
                  fontSize: 13 / textScaleFactor,
                  color: HexColor("#0D3662"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
