import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class More_Button extends StatefulWidget {
  @override
  _More_Button createState() => _More_Button();
}

class _More_Button extends State<More_Button> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;
    return Padding(
      padding: EdgeInsets.fromLTRB(width * .03, 0, 0, 0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FlatButton(
            onPressed: () {},
            child: new Stack(
              children: <Widget>[
                Text(
                  "Показать еще",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                    fontSize: 15.0 / textScaleFactor,
                    color: HexColor("#000080"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, height * .015, 0, 0),
                  child: Container(
                    width: width * .25,
                    height: height * .01,
                    color: HexColor("#965EFF").withOpacity(0.2),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
