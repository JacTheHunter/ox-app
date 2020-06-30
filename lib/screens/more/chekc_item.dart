import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CheckItem extends StatefulWidget {
  @override
  _CheckItemState createState() => _CheckItemState();
}

class _CheckItemState extends State<CheckItem> {
  bool wedVal = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Padding(
      padding: EdgeInsets.fromLTRB(width * .02, height * .025, width * .02, 0),
      child: Container(
        height: height * .08,
        width: width,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(width * .02, 7, 10, 7),
              child: Container(
                width: 36,
                height: 36,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Checkbox(
                    checkColor: Colors.blueAccent,
                    activeColor: Hexcolor("#EBF1FD"),
                    value: wedVal,
                    onChanged: (bool value) {
                      setState(() {
                        wedVal = value;
                      });
                    },
                  ),
                ),
              ),
            ),
            Text(
              "Accessories",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: 'Montserrat',
                fontSize: 16 / textScaleFactor,
                color: Hexcolor("#0D3662"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left:width * .34),
            ),
            Text(
              "(1263)",
              style: TextStyle(
                fontSize: 14 / textScaleFactor,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
                color: Hexcolor("#627285"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
