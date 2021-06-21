import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'thumb_custom.dart';
import 'dart:math';

class PriceFilter extends StatefulWidget {
  @override
  _PriceFilterState createState() => _PriceFilterState();
}

class _PriceFilterState extends State<PriceFilter> with SingleTickerProviderStateMixin {
  RangeValues _values = RangeValues(10, 20000);
  static Icon add = Icon(Icons.add, color: Color(0xFF0D3662));
  Icon remove = Icon(Icons.remove, color: Color(0xFF0D3662));
  var icon = add;
  String symbol1 = 'k';
  String symbol2 = 'mln';

  double roundDouble(double value, int places) {
    double mod = pow(10.0, places);
    return ((value * mod).round().toDouble() / mod);
  }

  @override
  Widget build(BuildContext context) {
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;
    var width = MediaQuery.of(context).size.width;
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
      title: Row(
        children: <Widget>[
          Text(
            'Цена',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: 'Montserrat',
                fontSize: 16 / textScaleFactor,
                color: HexColor("#0D3662")),
          ),
          SizedBox(width: width * .03),
          icon == remove
              ? Text(
                  '${_values.start >= 1000 ? roundDouble(_values.start / 1000, 1) : _values.start.toStringAsFixed(1)}$symbol1 ' +
                      '- ${_values.end >= 1000 ? roundDouble(_values.end / 1000, 1) : _values.end.toStringAsFixed(2)}$symbol2',
                  style: TextStyle(
                    color: Color(0xFF965EFF),
                    fontFamily: 'Montserrat',
                    fontSize: 16 / textScaleFactor,
                    fontWeight: FontWeight.w500,
                  ),
                )
              : SizedBox()
        ],
      ),
      children: <Widget>[
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: Color(0xFF965EFF),
            inactiveTrackColor: Color(0xFFD8D8D8),
            thumbColor: Color(0xFF965EFF),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 20),
            thumbShape: CircleThumbShape(thumbRadius: 20),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 50),
            child: RangeSlider(
              min: 10,
              max: 20000,
              divisions: 5,
              values: _values,
              labels: RangeLabels(
                _values.start.round().toString(),
                _values.end.round().toString(),
              ),
              onChanged: (RangeValues values) {
                setState(() {
                  _values = values;
                });
              },
              //onChanged: (value) {
              //  setState(() {
              //    _values = value;
              //    if (_values.start >= 1000) {
              //      symbol1 = 'mln';
              //    } else {
              //      symbol1 = 'k';
              //    }
              //    if (_values.end < 1000) {
              //      symbol2 = 'k';
              //    } else if (_values.end >= 1000) {
              //      symbol2 = 'mln';
              //    }
              //  });
              //},
            ),
          ),
        ),
      ],
    );
  }
}
