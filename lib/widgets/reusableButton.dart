import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  const ReusableButton({
    @required this.width,
    @required this.height,
    @required this.textScaleFactor,
    @required this.onPressed,
    @required this.text,
    @required this.fontsize,
    @required this.fontWeight,
    this.padding,
  });

  final double width;
  final double height;
  final double textScaleFactor;
  final Function onPressed;
  final String text;
  final double fontsize;
  final FontWeight fontWeight;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height * .08,
      child: RaisedButton(
        elevation: 0,
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: fontWeight,
            fontSize: fontsize / textScaleFactor,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(31),
        ),
        padding: const EdgeInsets.all(15),
        color: Colors.pink,
        textColor: Colors.white,
        onPressed: onPressed,
      ),
    );
  }
}
