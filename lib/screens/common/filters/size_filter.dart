import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuckingnum/screens/common/filters/size_filter_tile.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../categories2.dart';

class SizeFilter extends StatefulWidget {
  @override
  _SizeFilterState createState() => _SizeFilterState();
}

class _SizeFilterState extends State<SizeFilter> {
  static Icon add = Icon(Icons.add, color: Color(0xFF0D3662));
  Icon remove = Icon(Icons.remove, color: Color(0xFF0D3662));
  var icon = add;
  int _selectedCat = 0;
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;
    return ExpansionTile(
      trailing: Icon(
        Icons.keyboard_arrow_down,
        color: Hexcolor("#EBF1FD"),
      ),
      leading: Padding(padding: EdgeInsets.only(left: 6.1), child: icon),
      onExpansionChanged: (val) {
        setState(() {
          icon = icon == remove ? add : remove;
        });
      },
      title: Text(
        'Размер',
        style: TextStyle(
            fontWeight: FontWeight.w400,
            fontFamily: 'Montserrat',
            fontSize: 16 / textScaleFactor,
            color: Hexcolor("#0D3662")),
      ),
      children: <Widget>[
        Padding(
          padding:
              EdgeInsets.fromLTRB(width * .002, height * .001, width * .001, 5),
          child: Container(
            height: height * .098,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories2.length,
              itemBuilder: (ctx, i) {
                return SizeFilterTile(i);
              },
            ),
          ),
        ),
      ],
    );
  }
}
