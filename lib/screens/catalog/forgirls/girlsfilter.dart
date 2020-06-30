import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuckingnum/screens/more/chekc_item.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../categories1.dart';
import '../../../categories2.dart';

class filter extends StatefulWidget {
  @override
  _filter createState() => _filter();
}

class _filter extends State<filter> {
  RangeValues values = RangeValues(1, 100);
  int _selectedCat = 0;
  int _selectedCat1 = 0;
  static Icon add = Icon(Icons.add, color: Color(0xFF0D3662));
  Icon remove = Icon(Icons.remove, color: Color(0xFF0D3662));
  var icon = add;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      backgroundColor: Hexcolor("#F7F8FB"),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Hexcolor("#0D3662"),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        iconTheme: new IconThemeData(color: Hexcolor('#000080')),
        backgroundColor: Hexcolor("#F7F8FB"),
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Фильтр",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: 'Montserrat',
            fontSize: 19 / textScaleFactor,
            color: Hexcolor("#0D3662"),
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
                  color: Hexcolor("#627285"),
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
              color: Hexcolor("#EBF1FD"),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    top: 6.0, left: 6.0, right: 6.0, bottom: 6.0),
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Hexcolor("#EBF1FD")),
                  child: ExpansionTile(
                    trailing: Icon(
                      Icons.keyboard_arrow_down,
                      color: Hexcolor("#EBF1FD"),
                    ),
                    leading: Padding(
                        padding: EdgeInsets.only(left: 6.1), child: icon),
                    onExpansionChanged: (val) {
                      setState(() {
                        icon = icon == remove ? add : remove;
                      });
                    },
                    title: Text(
                      'Цена',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Montserrat',
                          fontSize: 16 / textScaleFactor,
                          color: Hexcolor("#0D3662")),
                    ),
                    children: <Widget>[
                      RangeSlider(
                        activeColor: Hexcolor("965EFF"),
                        inactiveColor: Hexcolor("#D8D8D8"),
                        min: 1,
                        max: 100,
                        values: values,
                        onChanged: (value) {
                          setState(() {
                            values = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                width * .02, height * .001, width * .02, height * .01),
            child: Card(
              elevation: 0,
              color: Hexcolor("#EBF1FD"),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    top: 6.0, left: 6.0, right: 6.0, bottom: 6.0),
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Hexcolor("#EBF1FD")),
                  child: ExpansionTile(
                    trailing: Icon(
                      Icons.keyboard_arrow_down,
                      color: Hexcolor("#EBF1FD"),
                    ),
                    leading: Padding(
                        padding: EdgeInsets.only(left: 6.1), child: icon),
                    onExpansionChanged: (val) {
                      setState(() {
                        icon = icon == remove ? add : remove;
                      });
                    },
                    title: Text(
                      'Категория',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Montserrat',
                          fontSize: 16 / textScaleFactor,
                          color: Hexcolor("#0D3662")),
                    ),
                    children: <Widget>[
                      CheckItem(),
                      CheckItem(),
                      CheckItem(),
                      CheckItem(),
                      CheckItem(),
                      CheckItem(),
                      SizedBox(height: height * .02),
                      Container(
                        padding: EdgeInsets.fromLTRB(
                            width * .02, 0, width * .02, height * .01),
                        height: height * .09,
                        width: width,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(14.0))),
                          onPressed: () {},
                          textColor: Colors.white,
                          color: Hexcolor("#0E3763"),
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              "Показать все категории",
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
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                width * .02, height * .001, width * .02, height * .01),
            child: Card(
              elevation: 0,
              color: Hexcolor("#EBF1FD"),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    top: 6.0, left: 6.0, right: 6.0, bottom: 6.0),
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Hexcolor("#EBF1FD")),
                  child: ExpansionTile(
                    trailing: Icon(
                      Icons.keyboard_arrow_down,
                      color: Hexcolor("#EBF1FD"),
                    ),
                    leading: Padding(
                        padding: EdgeInsets.only(left: 6.1), child: icon),
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
                          color: Hexcolor("#0D3662")),
                    ),
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            width * .02, 0, width * .01, 10),
                        child: Container(
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
                                  margin: EdgeInsets.fromLTRB(0, height * .01,
                                      width * .01, height * .01),
                                  width: width * .14,
                                  height: height * .001,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 3,
                                        color: _selectedCat1 == i
                                            ? Hexcolor("#965EFF")
                                            : Hexcolor("#EBF1FD")),
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: Container(
                                    width: width * .12,
                                    height: height * .07,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        SvgPicture.asset(
                                            "${categories1[i].title1}"),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                width * .02, height * .001, width * .02, height * .01),
            child: Card(
              elevation: 0,
              color: Hexcolor("#EBF1FD"),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    top: 6.0, left: 6.0, right: 6.0, bottom: 6.0),
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Hexcolor("#EBF1FD")),
                  child: ExpansionTile(
                    trailing: Icon(Icons.keyboard_arrow_down , color:Hexcolor("#EBF1FD"),),
                    leading: Padding(
                        padding: EdgeInsets.only(left: 6.1),
                        child: icon),
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
                        padding: EdgeInsets.fromLTRB(
                            width * .002, height * .001, width * .001, 5),
                        child: Container(
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
                                    color: _selectedCat == i
                                        ? Hexcolor("#EBF1FD")
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Container(
                                    width: width * .12,
                                    height: height * .03,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
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
                      ),
                    ],
                  ),
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
                width: width * .40,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(28.0))),
                  onPressed: () {},
                  elevation: 0,
                  textColor: Hexcolor("#0D3662"),
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
                width: width * .45,
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
