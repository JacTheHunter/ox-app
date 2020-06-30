import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuckingnum/categories3.dart';
import 'package:hexcolor/hexcolor.dart';

import 'mybuys_el.dart';

class MyBuys extends StatefulWidget {
  @override
  _MyBuys createState() => _MyBuys();
}

class _MyBuys extends State<MyBuys> {
  int _selectedCat = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Hexcolor("#F7F8FB"),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Hexcolor("#F7F8FB"),
        centerTitle: true,
        leading:
        IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Hexcolor("#0D3662"),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(5, 0, 0, 20),
                  child: Text(
                    "Мои покупки",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w600,
                      fontSize: 28,
                      color: Hexcolor("#0D3662"),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Hexcolor("#F7F8FB"),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories3.length,
                    itemBuilder: (ctx, i) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            _selectedCat = i;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.fromLTRB(5, 5, 10, 0),
                          width: 90,
                          height: 37,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: _selectedCat == i
                                ? Hexcolor("#965EFF")
                                : Hexcolor("#EBF1FD"),
                            borderRadius: BorderRadius.circular(9.0),
                          ),
                          child: Container(
                            width: 90,
                            height: 37,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9.0)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(
                                  "${categories3[i].title}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w400,
                                    color: _selectedCat == i
                                        ? Colors.white
                                        : Hexcolor("#627285"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                myBuys_el(),
                myBuys_el(),
                myBuys_el(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
