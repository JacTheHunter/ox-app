import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuckingnum/categories2.dart';
import 'package:fuckingnum/screens/shopingpage/list_of_products.dart';
import 'package:hexcolor/hexcolor.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int _selectedCat1 = 0;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    final List<String> types = [
      'Обувь',
      'Куртка',
      'Платье',
      'Поло',
      'Свитер',
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Hexcolor("#0D3662"),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: width / 20, top: height / 40),
                child: Text(
                  'Что Вы ищите?',
                  style: TextStyle(
                      color: Color(0xFF0D3662),
                      fontFamily: 'Montserrat',
                      fontSize: 19 / textScaleFactor,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: height / 45),
              Container(
                margin: EdgeInsets.only(left: width / 20),
                child: Text(
                  'Рубашка',
                  style: TextStyle(
                      color: Color(0xFFFF2D87),
                      fontFamily: 'Montserrat',
                      fontSize: 36 / textScaleFactor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: height / 30),
              Container(
                margin: EdgeInsets.only(left: width / 45),
                height: height / 19,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories2.length,
                  itemBuilder: (context, i) {
                    return InkWell(
                      onTap: () {
                        setState(
                          () {
                            _selectedCat1 = i;
                          },
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            left: width / 30, right: width * .001),
                        height: height / 30,
                        width: width / 5,
                        decoration: BoxDecoration(
                          color: _selectedCat1 == i
                              ? Hexcolor("#965EFF")
                              : Hexcolor("#EBF1FD"),
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: Center(
                          child: Text(
                            "${categories2[i].title}",
                            style: TextStyle(
                                color: _selectedCat1 == i
                                    ? Colors.white
                                    : Hexcolor("#627285"),
                                fontFamily: 'Montserrat',
                                fontSize: 14 / textScaleFactor,
                                fontWeight: FontWeight.w400),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: height / 15),
              Container(
                margin: EdgeInsets.only(left: width / 20),
                child: Text(
                  'Недавно Вы искали',
                  style: TextStyle(
                      color: Color(0xFF0D3662),
                      fontFamily: 'Montserrat',
                      fontSize: 19 / textScaleFactor,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: height / 70),
              List_Of_Products(),
              SizedBox(height: height / 20),
              Center(
                child: Container(
                  height: height / 15,
                  child: RaisedButton.icon(
                    elevation: 0.0,
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(31),
                    ),
                    icon: SvgPicture.asset('icons/scan.svg'),
                    label: Text(
                      'ОТСКАНИРОВАТЬ ШТРИХ-КОД',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Montserrat',
                          fontSize: 13 / textScaleFactor,
                          fontWeight: FontWeight.w500),
                    ),
                    color: Color(0xFFFF2D87),
                  ),
                ),
              ),
              SizedBox(height: height / 20),
            ],
          ),
        ),
      ),
    );
  }
}
