import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuckingnum/screens/common/filters/category_filter.dart';
import 'package:fuckingnum/screens/common/filters/color_filter.dart';
import 'package:fuckingnum/screens/common/filters/price_filter.dart';
import 'package:fuckingnum/screens/common/filters/size_filter.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../categories2.dart';

class Filter extends StatefulWidget {
  @override
  _Filter createState() => _Filter();
}

class _Filter extends State<Filter> {
  RangeValues values = RangeValues(1, 100);

  static Icon add = Icon(Icons.add, color: Color(0xFF0D3662));
  Icon remove = Icon(Icons.remove, color: Color(0xFF0D3662));
  var icon = add;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      backgroundColor: HexColor("#F7F8FB"),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: HexColor("#0D3662"),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        iconTheme: new IconThemeData(color: HexColor('#000080')),
        backgroundColor: HexColor("#F7F8FB"),
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Фильтр",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: 'Montserrat',
            fontSize: 19 / textScaleFactor,
            color: HexColor("#0D3662"),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: width * .05),
            child: Center(
              child: Text(
                "Очистить",
                style: TextStyle(
                  fontSize: 16 / textScaleFactor,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  color: HexColor("#627285"),
                ),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(
                width * .02, height * .001, width * .02, height * .01),
            child: Card(
              elevation: 0,
              color: HexColor("#EBF1FD"),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    top: 6.0, left: 6.0, right: 6.0, bottom: 6.0),
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: HexColor("#EBF1FD")),
                  child: PriceFilter(),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                width * .02, height * .001, width * .02, height * .01),
            child: Card(
              elevation: 0,
              color: HexColor("#EBF1FD"),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    top: 6.0, left: 6.0, right: 6.0, bottom: 6.0),
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: HexColor("#EBF1FD")),
                  child: CategoryFilter(),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                width * .02, height * .001, width * .02, height * .01),
            child: Card(
              elevation: 0,
              color: HexColor("#EBF1FD"),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    top: 6.0, left: 6.0, right: 6.0, bottom: 6.0),
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: HexColor("#EBF1FD")),
                  child: ColorFilter(),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                width * .02, height * .001, width * .02, height * .01),
            child: Card(
              elevation: 0,
              color: HexColor("#EBF1FD"),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    top: 6.0, left: 6.0, right: 6.0, bottom: 6.0),
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: HexColor("#EBF1FD")),
                  child: SizeFilter(),
                ),
              ),
            ),
          ),
          SizedBox(height: height * .02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                height: height * .09,
                //width: width * .40,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(28.0))),
                  onPressed: () {},
                  elevation: 0,
                  textColor: HexColor("#0D3662"),
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "СБРОСИТЬ",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0 / textScaleFactor,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                height: height * .09,
                //width: width * .45,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(28.0))),
                  onPressed: () {},
                  elevation: 0,
                  textColor: Colors.white,
                  color: Colors.pink,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "ПРИМЕНИТЬ",
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
          SizedBox(height: height * .03),
        ],
      ),
    );
  }
}
