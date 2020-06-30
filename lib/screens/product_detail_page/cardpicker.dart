import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../categories1.dart';
import '../../categories2.dart';

class Variation extends StatefulWidget {
  @override
  _Variation createState() => _Variation();
}

class _Variation extends State<Variation> {
  int _selectedCat = 0;
  int _selectedCat1 = 0;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Padding(
      padding: EdgeInsets.fromLTRB(18, 19, 15, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(17),
            width: 342,
            height: 270,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(29.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Размер",
                  style: TextStyle(
                      color: Hexcolor("#0D3662"),
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                      fontSize: 15.0),
                ),
                SizedBox(height: 8),
                Container(
                  height: height * .098,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories2.length,
                    itemBuilder: (ctx, i) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            _selectedCat = i;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.fromLTRB(
                              width * .01, 0, width * .03, 0),
                          width: width * .12,
                          height: height * .03,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Hexcolor("#EBF1FD"),
                            border: Border.all(
                              width: 2.5,
                              color: _selectedCat == i
                                  ? Hexcolor("#965EFF")
                                  : Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Container(
                            width: width * .12,
                            height: height * .03,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(
                                  "${categories2[i].title}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16 / textScaleFactor,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w500,
                                      color: Hexcolor("#6683A5")),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 19),
                Text(
                  "Цвет",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Montserrat',
                      color: Hexcolor("#0D3662")),
                ),
                SizedBox(height: 10),
                Container(
                  height: height * .09,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories1.length,
                    itemBuilder: (ctx, i) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            _selectedCat1 = i;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.fromLTRB(
                              0, height * .01, width * .01, height * .01),
                          width: width * .14,
                          height: height * .001,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 3,
                                color: _selectedCat1 == i
                                    ? Hexcolor("#965EFF")
                                    : Colors.white),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Container(
                            width: width * .12,
                            height: height * .07,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                SvgPicture.asset("${categories1[i].title1}"),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
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
