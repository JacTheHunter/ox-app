import 'package:flutter/material.dart';
import '../model/slide.dart';

class SlideItem extends StatelessWidget {
  final int index;
  SlideItem(this.index);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: height * .04),
        Text(
          slideList[index].description,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontSize: 28.0 / textScaleFactor,
              fontWeight: FontWeight.w600,
              fontFamily: 'Montserrat'
          ),
        ),
      ],
    );
  }
}