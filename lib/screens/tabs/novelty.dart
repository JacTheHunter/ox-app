import 'package:flutter/material.dart';
import 'package:fuckingnum/screens/catalog/bottom_button.dart';
import 'package:fuckingnum/screens/catalog/grid_hot_buys.dart';
import 'package:hexcolor/hexcolor.dart';

class Novelty extends StatefulWidget {
  @override
  _Novelty createState() => _Novelty();
}

class _Novelty  extends State<Novelty> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          children: <Widget>[
            new BottomButton(),
            new Padding(
              padding: EdgeInsets.all(20),
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Горячие новинки этого сезона",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      fontSize: 19.0,
                      color: Hexcolor("#0D3662"),
                    ),
                  ),
                ],
              ),
            ),
            new Grid_Hot_Buys(),
            new Padding(
              padding: EdgeInsets.all(20),
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Новые поступления",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      fontSize: 19.0,
                      color: Hexcolor("#0D3662"),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    width: 327,
                    height: 597,
                    decoration: BoxDecoration(
                      color: Hexcolor('#EBF1FD'),
                      borderRadius: BorderRadius.circular(31.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(17, 16, 19, 0),
                          child: Container(
                            width: 295,
                            height: 67,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(23.0)),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: 47,
                                    height: 47,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(11.0),
                                      child: Image.asset('icons/clothes.jpg',
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  Text(
                                    "Clothing",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w500,
                                        color: Hexcolor("#0D3662")),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(17, 16, 19, 0),
                          child: Container(
                            width: 295,
                            height: 67,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(23.0)),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: 47,
                                    height: 47,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(11.0),
                                      child: Image.asset('icons/shoes.jpg',
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  Text(
                                    "Shoes",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w500,
                                        color: Hexcolor("#0D3662")),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(17, 16, 19, 0),
                          child: Container(
                            width: 295,
                            height: 67,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(23.0)),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: 47,
                                    height: 47,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(11.0),
                                      child: Image.asset(
                                          'icons/sunglassses.jpg',
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  Text(
                                    "Accessories",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w500,
                                        color: Hexcolor("#0D3662")),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(17, 16, 19, 0),
                          child: Container(
                            width: 295,
                            height: 67,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(23.0)),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: 47,
                                    height: 47,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(11.0),
                                      child: Image.asset(
                                          'icons/sunglassses.jpg',
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  Text(
                                    "Activewear",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w500,
                                        color: Hexcolor("#0D3662")),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(17, 16, 19, 0),
                          child: Container(
                            width: 295,
                            height: 67,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(23.0)),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: 47,
                                    height: 47,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(11.0),
                                      child: Image.asset('icons/facebody.jpg',
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  Text(
                                    "Face + Body",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w500,
                                        color: Hexcolor("#0D3662")),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(17, 16, 19, 0),
                          child: Container(
                            width: 295,
                            height: 67,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(23.0)),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: 47,
                                    height: 47,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(11.0),
                                      child: Image.asset(
                                          'icons/sunglassses.jpg',
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  Text(
                                    "Gifts",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w500,
                                        color: Hexcolor("#0D3662")),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(17, 16, 19, 0),
                          child: Container(
                            width: 295,
                            height: 67,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(23.0)),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: 47,
                                    height: 47,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(11.0),
                                      child: Image.asset(
                                          'icons/sunglassses.jpg',
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  Text(
                                    "Outlet",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w500,
                                        color: Hexcolor("#0D3662")),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ],
    );
  }
}
