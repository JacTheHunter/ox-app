import 'dart:ui';
import 'package:flutter/material.dart';

class List_Girls_Element extends StatelessWidget{

  final String image;
   final String title;

  List_Girls_Element(this.image , this.title);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Container(
      padding: EdgeInsets.fromLTRB(0, height * .015, width * .01, 0),
      width: width / 2.2,
      height: height ,
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
              colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken),
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child:Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: 'Montserrat',
                fontSize: 19.0 / textScaleFactor,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

