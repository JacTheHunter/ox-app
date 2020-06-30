import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'balanceel.dart';
import '../models/balance_constructor.dart';

class History extends StatefulWidget {
  @override
  _History createState() => _History();
}

class _History extends State<History> {
  final List<Balance_Constructor> balance = [
    Balance_Constructor(
        price: "+400 000",
        date: "12.01.2020",
        time: "14:55",
        company: "USPOLO SD",
        type: "Cashback",
        number: "98832"),
    Balance_Constructor(
        price: "+400 000",
        date: "12.01.2020",
        time: "14:55",
        company: "USPOLO SD",
        type: "Cashback",
        number: "98832"),
    Balance_Constructor(
        price: "+400 000",
        date: "12.01.2020",
        time: "14:55",
        company: "USPOLO SD",
        type: "Cashback",
        number: "98832"),
    Balance_Constructor(
        price: "+400 000",
        date: "12.01.2020",
        time: "14:55",
        company: "USPOLO SD",
        type: "Cashback",
        number: "98832"),
    Balance_Constructor(
        price: "+400 000",
        date: "12.01.2020",
        time: "14:55",
        company: "USPOLO SD",
        type: "Cashback",
        number: "98832"),
    Balance_Constructor(
        price: "+400 000",
        date: "12.01.2020",
        time: "14:55",
        company: "USPOLO SD",
        type: "Cashback",
        number: "98832"),
    Balance_Constructor(
        price: "+400 000",
        date: "12.01.2020",
        time: "14:55",
        company: "USPOLO SD",
        type: "Cashback",
        number: "98832"),
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Hexcolor("#F7F8FB"),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Hexcolor("#F7F8FB"),
        title: Text(
          "U.S. POLO ASSN.",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: "Montserrat",
            fontSize: 19,
            color: Hexcolor("#0D3662"),
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Column(
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
                            child: SvgPicture.asset(
                              'icons/money1.svg',
                              height: height / 15,
                              color: Colors.white,
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
                          SvgPicture.asset(
                            'icons/money.svg',
                            height: height / 15,
                            color: Colors.white,
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
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 40, 0, 20),
            child: Text(
              "История",
              style: TextStyle(
                fontSize: 19,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w600,
                color: Hexcolor("#0D3662"),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: Hexcolor('#EBF1FD'),
                borderRadius: BorderRadius.circular(25),
              ),
              child: ListView.builder(
                padding: EdgeInsets.only(top: 20),
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: balance.length,
                itemBuilder: (context, index) {
                  return BalanceElement(
                    balance[index].price,
                    balance[index].date,
                    balance[index].time,
                    balance[index].company,
                    balance[index].type,
                    balance[index].number,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
