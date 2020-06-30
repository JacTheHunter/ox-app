import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Grid_Item extends StatelessWidget {
  final String image;

  Grid_Item(this.image);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: 106,
          height: 106,
          child: GridTile(
            child: Image.asset(image, fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
