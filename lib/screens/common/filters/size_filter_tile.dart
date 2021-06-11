import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../categories2.dart';

class SizeFilterTile extends StatefulWidget {
  int index;

  SizeFilterTile(this.index);

  @override
  _SizeFilterTileState createState() => _SizeFilterTileState();
}

class _SizeFilterTileState extends State<SizeFilterTile> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(width * .01, 0, width * .03, 0),
        width: width * .12,
        height: height * .03,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 2.5,
            color: _isSelected ? Hexcolor("#965EFF") : Colors.white,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          width: width * .12,
          height: height * .03,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                "${categories2[widget.index].title}",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16 / textScaleFactor,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                    color: _isSelected
                        ? Hexcolor("#0D3662")
                        : Hexcolor("#6683A5")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
