import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_verification_code_input/flutter_verification_code_input.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'change_password.dart';

class Security extends StatefulWidget {
  @override
  _SecurityState createState() => _SecurityState();
}

class _SecurityState extends State<Security> {
  void _fingerPrint(context) {
    showModalBottomSheet(
        backgroundColor: Colors.white,
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(29), topLeft: Radius.circular(29.0)),
        ),
        builder: (BuildContext bc) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 18),
                child: Container(
                  width: 38,
                  height: 6,
                  decoration: BoxDecoration(
                      color: Hexcolor("#979797"),
                      borderRadius: BorderRadius.circular(4.5)),
                ),
              ),
              Expanded(
                child: Container(
                  width: 327,
                  height: 326,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 50),
                      SvgPicture.asset('icons/fingerprint.svg'),
                      SizedBox(height: 50),
                      Text(
                        "Отсканируйте свой палец",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Montserrat',
                          fontSize: 16,
                          color: Hexcolor('#627285'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }

  void _pinCode(context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(29),
          topLeft: Radius.circular(29.0),
        ),
      ),
      builder: (BuildContext bc) {
        return Wrap(
          children: <Widget>[
            Container(
              height: height,
              width: width,
              child: Column(
                children: <Widget>[
                  SizedBox(height: height / 50),
                  Container(
                    width: width / 10,
                    height: height / 120,
                    decoration: BoxDecoration(
                      color: Hexcolor("#EBF1FD"),
                      borderRadius: BorderRadius.circular(4.5),
                    ),
                  ),
                  SizedBox(height: height / 20),
                  Text(
                    'Введите код',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18 / textScaleFactor,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF627285),
                    ),
                  ),
                  SizedBox(height: height / 50),
                  Container(
                    width: width / 2.5,
                    height: height / 15,
                    decoration: BoxDecoration(
                      color: Color(0xFFEBF1FD),
                      borderRadius: BorderRadius.circular(28.5),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(height * .018, 0, 0, 0),
                      child: VerificationCodeInput(
                        itemSize: height / 25,
                        keyboardType: TextInputType.number,
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16 / textScaleFactor,
                          fontFamily: "Montserrat",
                          color: Hexcolor("#0D3662"),
                        ),
                        length: 4,
                        onCompleted: (String value) {
                          print(value);
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: height / 30),
                  RaisedButton(
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(31),
                    ),
                    color: Color(0xFFFF2D87),
                    onPressed: () {},
                    child: Container(
                      width: width / 2.9,
                      height: height / 15,
                      padding: EdgeInsets.all(19 / textScaleFactor),
                      child: Text(
                        'ПОДТВЕРДИТЬ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 15 / textScaleFactor,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height / 30),
                  Container(
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Не пришло CМС?',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 16 / textScaleFactor,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF627285),
                            ),
                          ),
                          TextSpan(
                            text: ' Отправить еще раз',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 16 / textScaleFactor,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF0D3662),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Hexcolor("#F7F8FB"),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Hexcolor("#F7F8FB"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Hexcolor("#0D3662"),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "Изменить данные",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 19,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
            color: Hexcolor("#0D3662"),
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  width: 323,
                  height: 253,
                  decoration: BoxDecoration(
                      color: Hexcolor('#EBF1FD'),
                      borderRadius: BorderRadius.circular(25.0)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(17, 16, 19, 0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              new CupertinoPageRoute(
                                  builder: (context) => new changePassword()),
                            );
                          },
                          child: Container(
                            width: 286,
                            height: 60,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(14.0)),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  SvgPicture.asset("icons/order.svg"),
                                  SizedBox(width: 15),
                                  Text(
                                    "Изменить пароль",
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
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(17, 16, 19, 0),
                        child: InkWell(
                          onTap: () {
                            _fingerPrint(context);
                          },
                          child: Container(
                            width: 286,
                            height: 60,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(14.0)),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  SvgPicture.asset("icons/brands.svg"),
                                  SizedBox(width: 14),
                                  Text(
                                    "Отпечаток пальца",
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
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(17, 16, 19, 0),
                        child: InkWell(
                          onTap: () {
                            _pinCode(context);
                          },
                          child: Container(
                            width: 286,
                            height: 60,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(14.0)),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  SvgPicture.asset("icons/smallcard.svg"),
                                  SizedBox(width: 15),
                                  Text(
                                    "Пин-код",
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
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

    );
  }
}
