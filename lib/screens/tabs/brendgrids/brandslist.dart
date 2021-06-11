import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class brandList extends StatefulWidget {
  final String image;

  brandList(this.image);

  @override
  _brandListState createState() => _brandListState();
}

class _brandListState extends State<brandList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2),
      child: Container(
        height: 25,
        width: 25,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          image: DecorationImage(
              image: AssetImage(widget.image), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
