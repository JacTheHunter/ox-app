import 'package:flutter/material.dart';
import 'package:fuckingnum/transitions/rightslide.dart';
import 'forgirls/girls_clothes.dart';

class Grid_Card_Item extends StatelessWidget {
  final String image;
  final String title;

  Grid_Card_Item(this.image, this.title);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Container(
      padding: EdgeInsets.fromLTRB(0, height  *.015, width * .01, 0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, SlideRightRoute(widget: Girls_Clothes()));
        },
        child: Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          elevation: 0,
          margin: EdgeInsets.all(1),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Montserrat',
                  fontSize: 16.0 / textScaleFactor,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
