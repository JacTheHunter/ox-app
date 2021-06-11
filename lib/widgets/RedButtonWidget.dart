import 'package:flutter/material.dart';

class PinkButton extends StatelessWidget {
  String text;

  PinkButton(this.text);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;
    return Container(
      width: width * .8,
      height: height * .08,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.pinkAccent,
      ),
      child: Center(
        child: Text(
          this.text,
          textScaleFactor: 1,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 16),
        ),
      ),
    );
  }
}
