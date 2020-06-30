import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'history.dart';

class Balance extends StatefulWidget {
  @override
  _Balance createState() => _Balance();
}

class _Balance extends State<Balance> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
          child: Container(
            height: MediaQuery.of(context).size.height / 8,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.125),
                  spreadRadius: 25,
                  blurRadius: 25,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Card(
              color: Hexcolor("#FF2727"),
              elevation: 1,
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Row(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Мой баланс",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "809 000 UZS",
                          style: TextStyle(
                            fontSize: 28,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: width / 6),
                    Expanded(
                      child: SvgPicture.asset('icons/money1.svg',
                          height: height / 4),
                    ),
                    Expanded(
                      child: IconButton(
                        alignment: Alignment.centerRight,
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(29.0),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(15, 5, 15, 0),
          child: InkWell(
            child: Container(
              height: MediaQuery.of(context).size.height / 8,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.125),
                    spreadRadius: 25,
                    blurRadius: 25,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Card(
                color: Hexcolor("#965EFF"),
                elevation: 1,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Row(
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Мой балловый баланс",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "4.8 баллов",
                            style: TextStyle(
                              fontSize: 28,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: width / 4.5),
                      Expanded(
                        child: SvgPicture.asset(
                          'icons/money.svg',
                          height: height / 4,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          alignment: Alignment.centerRight,
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(29.0),
                ),
              ),
            ),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => History())),
          ),
        ),
      ],
    );
  }
}
