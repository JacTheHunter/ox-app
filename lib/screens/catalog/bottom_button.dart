import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class BottomButton extends StatefulWidget {
  @override
  _BottomButton createState() => _BottomButton();
}

class _BottomButton extends State<BottomButton> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;
    return Padding(
      padding: EdgeInsets.fromLTRB(width * .045, 0, width * .045, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            padding: EdgeInsets.all(10),
            width: width,
            height: height * .3,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(width: width * .01),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            width: width * .2,
                            height: height *  .05,
                            decoration: BoxDecoration(
                                color: Hexcolor("#EBF1FD"),
                                borderRadius: BorderRadius.circular(9.0)),
                            child: Center(
                              child: Text(
                                "578",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 19.0 / textScaleFactor,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "Новых товаров",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Montserrat',
                              fontSize: 16.0 / textScaleFactor,
                            ),
                          ),
                          Text(
                            "за последние 24 часа",
                            style: TextStyle(
                              fontSize: 16.0 / textScaleFactor,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: width / 5.5,
                        height: height / 6,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset("images/botbut.jpg",
                              fit: BoxFit.cover),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(width * .04, 0, width * .04, 0),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, height * .01),
                    height: height / 12,
                    width: width,
                    child: RaisedButton(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(60.0),
                        ),
                      ),
                      onPressed: () {},
                      textColor: Colors.white,
                      color: Colors.pink,
                      child: Text(
                        "ПОКАЗАТЬ ВСЕХ",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0 / textScaleFactor,
                        ),
                      ),
                    ),
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
