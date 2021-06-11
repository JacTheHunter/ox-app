import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../categories1.dart';

class ColorFilterTile extends StatefulWidget {
  int index;

  ColorFilterTile(this.index);

  @override
  _ColorFilterTileState createState() => _ColorFilterTileState();
}

class _ColorFilterTileState extends State<ColorFilterTile> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(0, height * .01, width * .01, height * .01),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              width: 3,
              color: _isSelected ? Hexcolor("#965EFF") : Hexcolor("#EBF1FD")),
        ),
        child: Container(
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SvgPicture.asset("${categories1[widget.index].title1}"),
            ],
          ),
        ),
      ),
    );
  }
}
