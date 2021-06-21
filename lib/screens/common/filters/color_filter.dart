import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuckingnum/screens/common/filters/color_filter_tile.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../categories1.dart';

class ColorFilter extends StatefulWidget {
  @override
  _ColorFilterState createState() => _ColorFilterState();
}

class _ColorFilterState extends State<ColorFilter> {
  static Icon add = Icon(Icons.add, color: Color(0xFF0D3662));
  Icon remove = Icon(Icons.remove, color: Color(0xFF0D3662));
  var icon = add;
  int _selectedCat1 = 0;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;
    return ExpansionTile(
      trailing: Icon(
        Icons.keyboard_arrow_down,
        color: HexColor("#EBF1FD"),
      ),
      leading: Padding(padding: EdgeInsets.only(left: 6.1), child: icon),
      onExpansionChanged: (val) {
        setState(() {
          icon = icon == remove ? add : remove;
        });
      },
      title: Text(
        'Цвет',
        style: TextStyle(
            fontWeight: FontWeight.w400,
            fontFamily: 'Montserrat',
            fontSize: 16 / textScaleFactor,
            color: HexColor("#0D3662")),
      ),
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(width * .02, 0, width * .01, 10),
          child: Container(
            height: height * .09,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories1.length,
              itemBuilder: (ctx, i) {
                return ColorFilterTile(i);
              },
            ),
          ),
        ),
      ],
    );
  }
}
