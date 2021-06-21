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
        price: "+400 000 UZS",
        date: "12.01.2020",
        time: "14:55",
        company: "USPOLO SD",
        type: "Cashback",
        number: "98832"),
    Balance_Constructor(
        price: "+400 000 UZS",
        date: "12.01.2020",
        time: "14:55",
        company: "USPOLO SD",
        type: "Cashback",
        number: "98832"),
    Balance_Constructor(
        price: "+400 000 UZS",
        date: "12.01.2020",
        time: "14:55",
        company: "USPOLO SD",
        type: "Cashback",
        number: "98832"),
    Balance_Constructor(
        price: "+400 000 UZS",
        date: "12.01.2020",
        time: "14:55",
        company: "USPOLO SD",
        type: "Cashback",
        number: "98832"),
    Balance_Constructor(
        price: "+400 000 UZS",
        date: "12.01.2020",
        time: "14:55",
        company: "USPOLO SD",
        type: "Cashback",
        number: "98832"),
    Balance_Constructor(
        price: "+400 000 UZS",
        date: "12.01.2020",
        time: "14:55",
        company: "USPOLO SD",
        type: "Cashback",
        number: "98832"),
    Balance_Constructor(
        price: "+400 000 UZS",
        date: "12.01.2020",
        time: "14:55",
        company: "USPOLO SD",
        type: "Cashback",
        number: "98832"),
    Balance_Constructor(
        price: "+400 000 UZS",
        date: "12.01.2020",
        time: "14:55",
        company: "USPOLO SD",
        type: "Cashback",
        number: "98832"),
    Balance_Constructor(
        price: "+400 000 UZS",
        date: "12.01.2020",
        time: "14:55",
        company: "USPOLO SD",
        type: "Cashback",
        number: "98832"),
    Balance_Constructor(
        price: "+400 000 UZS",
        date: "12.01.2020",
        time: "14:55",
        company: "USPOLO SD",
        type: "Cashback",
        number: "98832"),
    Balance_Constructor(
        price: "+400 000 UZS",
        date: "12.01.2020",
        time: "14:55",
        company: "USPOLO SD",
        type: "Cashback",
        number: "98832"),
    Balance_Constructor(
        price: "+400 000 UZS",
        date: "12.01.2020",
        time: "14:55",
        company: "USPOLO SD",
        type: "Cashback",
        number: "98832"),
    Balance_Constructor(
        price: "+400 000 UZS",
        date: "12.01.2020",
        time: "14:55",
        company: "USPOLO SD",
        type: "Cashback",
        number: "98832"),
  ];
  var items = List<Balance_Constructor>();

  int present = 0;
  int perPage = 4;

  @override
  void initState() {
    super.initState();
    setState(() {
      items.addAll(balance.getRange(present, present + perPage));
      present = present + perPage;
    });
  }

  void loadMore() {
    setState(() {
      if ((present + perPage) > balance.length) {
        items.addAll(balance.getRange(present, balance.length));
      } else {
        items.addAll(balance.getRange(present, present + perPage));
      }
      present = present + perPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: Color(0xFF0D3662),
            size: 40 / textScaleFactor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "U.S. POLO ASSN.",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: "Montserrat",
            fontSize: 19,
            color: HexColor("#0D3662"),
          ),
        ),
      ),
      body: Container(
        child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            if (scrollInfo.metrics.pixels ==
                scrollInfo.metrics.maxScrollExtent) {
              loadMore();
            }
          },
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 8,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(29),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 13,
                            offset: Offset(0, 5), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Card(
                        color: HexColor("#FF2727"),
                        elevation: 0,
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
                                      color: Colors.white.withOpacity(0.7),
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: '809 000',
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: ' UZS',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
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
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(29),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 13,
                            offset: Offset(0, 5), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Card(
                        color: HexColor("#965EFF"),
                        elevation: 0,
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
                                      color: Colors.white.withOpacity(0.7),
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: '4.8',
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: ' баллов',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
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
                    color: HexColor("#0D3662"),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Container(
                  padding: EdgeInsets.only(bottom: height / 30),
                  width: width,
                  decoration: BoxDecoration(
                    color: HexColor('#EBF1FD'),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: ListView.builder(
                    //TODO: Finish Advanced History
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: 20),
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: (present <= balance.length)
                        ? items.length + 1
                        : items.length,
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
        ),
      ),
    );
  }
}
