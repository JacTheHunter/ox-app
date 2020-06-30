import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:flutter_verification_code_input/flutter_verification_code_input.dart';
import 'package:hexcolor/hexcolor.dart';

class NewCard extends StatefulWidget {
  @override
  _NewCardState createState() => _NewCardState();
}

class _NewCardState extends State<NewCard> {
  void _settingModalBottomSheet(context) {
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
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(31),
                    ),
                    color: Color(0xFFFF2D87),
                    onPressed: () {},
                    child: Container(
                      width: width / 2.9,
                      height: height / 15,
                      child: Center(
                        child: Text(
                          'ПОДТВЕРДИТЬ',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 15 / textScaleFactor,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
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

  bool wedVal = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF7F8FB),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color(0xFFF7F8FB),
          leading:  IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Hexcolor("#0D3662"),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          centerTitle: true,
          title: Text(
            'Добавить карту',
            style: TextStyle(
              fontSize: 19 / textScaleFactor,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
              color: Color(0xFF0D3662),
            ),
            textAlign: TextAlign.justify,
          ),
          actions: <Widget>[
            Container(
              width: width / 7,
              height: height / 40,
              margin: EdgeInsets.fromLTRB(
                  0, height * .01, width * .05, height * .01),
              decoration: BoxDecoration(
                color: Color(0xFFEBF1FD),
                borderRadius: BorderRadius.circular(13),
                shape: BoxShape.rectangle,
              ),
              child: Image.asset("icons/focus.png", fit: BoxFit.scaleDown),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: height / 20),
              Container(
                width: width,
                height: height,
                padding: EdgeInsets.all(height / 40),
                margin: EdgeInsets.only(
                  right: width / 13,
                  left: width / 13,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(31),
                  color: Color(0xFFEBF1FD),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: width,
                      height: height / 12,
                      padding: EdgeInsets.all(19 / textScaleFactor),
                      decoration: BoxDecoration(
                        color: Color(0xFF0D3662),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: height / 25,
                            width: width / 15,
                            child: Image.asset('icons/dots.png'),
                          ),
                          SizedBox(width: width * .01),
                          Text(
                            '324 984',
                            style: TextStyle(
                                fontSize: 16 / textScaleFactor,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Montserrat',
                                color: Colors.white),
                          ),
                          SizedBox(width: width / 3.4),
                          Container(
                            height: height / 15,
                            width: width / 8,
                            child: Image.asset('icons/humo.png'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: height / 30),
                    Text(
                      'Название карты',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 17 / textScaleFactor,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF627285),
                      ),
                    ),
                    SizedBox(height: height / 40),
                    Container(
                      padding:
                          EdgeInsets.fromLTRB(width * .05, height * .005, 0, 0),
                      height: height / 15,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28.5),
                          color: Colors.white),
                      child: TextField(
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 16 / textScaleFactor,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF0D3662),
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Введите название карты',
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(height: height / 30),
                    Text(
                      'Номер карты',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 17 / textScaleFactor,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF627285),
                      ),
                    ),
                    SizedBox(height: height / 40),
                    Container(
                      padding:
                          EdgeInsets.fromLTRB(width * .05, height * .005, 0, 0),
                      height: height / 15,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28.5),
                          color: Colors.white),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 16 / textScaleFactor,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF0D3662),
                        ),
                        inputFormatters: [CreditCardNumberInputFormatter()],
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Введите номер карты',
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(height: height / 30),
                    Text(
                      'Срок действия карты',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 17 / textScaleFactor,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF627285),
                      ),
                    ),
                    SizedBox(height: height / 40),
                    Container(
                      padding:
                          EdgeInsets.fromLTRB(width * .05, height * .005, 0, 0),
                      height: height / 15,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28.5),
                          color: Colors.white),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 16 / textScaleFactor,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF0D3662),
                        ),
                        inputFormatters: [
                          CreditCardExpirationDateFormatter(),
                        ],
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'ММ/ГГ',
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(height: height / 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Checkbox(
                            activeColor: Hexcolor("#FF2D87"),
                            value: wedVal,
                            onChanged: (bool value) {
                              setState(() {
                                wedVal = value;
                              });
                            }),
                        SizedBox(width: width * .01),
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text:
                                    'Сохранить эту карту. Это безопасно. \nСохраняя карту Вы соглашаетесь с',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 13 / textScaleFactor,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF627285),
                                ),
                              ),
                              TextSpan(
                                text: '\nусловиями привязки карты',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 12 / textScaleFactor,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF0D3662),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height / 30),
                    Container(
                      width: width,
                      height: 62,
                      child: RaisedButton(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(31),
                        ),
                        color: Color(0xFFFF2D87),
                        onPressed: () {
                          _settingModalBottomSheet(context);
                        },
                        child: Text(
                          'ДОБАВИТЬ КАРТУ ОПЛАТЫ',
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 16 / textScaleFactor,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
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
      ),
    );
  }
}
