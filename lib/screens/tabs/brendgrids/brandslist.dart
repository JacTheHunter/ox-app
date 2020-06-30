import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class brandList extends StatelessWidget {
  final String image;

  brandList(this.image);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2),
      child: Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Image.asset(image, fit: BoxFit.cover),
      ),
    );
  }
}
