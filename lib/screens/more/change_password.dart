import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fuckingnum/styles/sign-up-style.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePassword createState() => _ChangePassword();
}

class _ChangePassword extends State<ChangePassword>
    with WidgetsBindingObserver {
  final _text1 = TextEditingController();
  final _text2 = TextEditingController();

  double _overlap = 0;

  bool _validate1 = true;
  bool _validate2 = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeMetrics() {
    final renderObject = context.findRenderObject();
    final renderBox = renderObject as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);
    final widgetRect = Rect.fromLTWH(
      offset.dx,
      offset.dy,
      renderBox.size.width,
      renderBox.size.height,
    );
    final keyboardTopPixels =
        window.physicalSize.height - window.viewInsets.bottom;
    final keyboardTopPoints = keyboardTopPixels / window.devicePixelRatio;
    final overlap = widgetRect.bottom - keyboardTopPoints;
    if (overlap >= 0) {
      setState(() {
        _overlap = overlap;
      });
    }
  }

  @override
  void dispose() {
    _text1.dispose();
    _text2.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    void _wrongPassword(context) {
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
                      SizedBox(height: 57),
                      Container(
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
                        child: ClipOval(
                          child: Material(
                            color: Colors.white, // button color
                            child: InkWell(
                              onTap: () {},
                              child: SizedBox(
                                width: 82,
                                height: 82,
                                child: Center(
                                  child: SvgPicture.asset('icons/close1.svg'),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 47),
                      Text(
                        "ОШИБКА",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Montserrat',
                          fontSize: 19,
                          color: Hexcolor('#0D3662'),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Старый пароль неверный",
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
        },
      );
    }

    final oldpassword = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Ваш старый пароль",
            style: SignUpStyle.getLabelsTextStyle(textScaleFactor)),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.only(top: height * .01, left: width * .05),
          decoration: kBoxDecorationStyle,
          height: height / 14,
          child: TextField(
            style: SignUpStyle.getInputFieldsTextStyle(textScaleFactor),
            textAlign: TextAlign.start,
            decoration: SignUpStyle.getInputFieldsDecoration(),
            obscureText: true,
          ),
        )
      ],
    );

    final newpassword = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Новый пароль",
            style: SignUpStyle.getLabelsTextStyle(textScaleFactor)),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          padding: EdgeInsets.only(left: width * .05),
          height: height / 14,
          child: TextField(
            obscureText: true,
            controller: _text1,
            onChanged: (_) {
              setState(() {
                _text1.text.isEmpty ? _validate1 = true : _validate1 = false;
              });
            },
            style: SignUpStyle.getInputFieldsTextStyle(textScaleFactor),
            textAlign: TextAlign.start,
            decoration: InputDecoration(
              border: InputBorder.none,
              suffixIcon: _validate1
                  ? null
                  : Container(
                margin: EdgeInsets.only(top: 10),
                child: Image.asset(
                  'icons/success.png',
                  height: height,
                ),
              ),
            ),
          ),
        ),
      ],
    );

    final repeatpassword = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Повторите новый пароль",
            style: SignUpStyle.getLabelsTextStyle(textScaleFactor)),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          padding: EdgeInsets.only(left: width * .05),
          height: height / 14,
          child: TextField(
            obscureText: true,
            controller: _text2,
            onChanged: (_) {
              setState(() {
                _text2.text.isEmpty ? _validate2 = true : _validate2 = false;
              });
            },
            style: SignUpStyle.getInputFieldsTextStyle(textScaleFactor),
            textAlign: TextAlign.start,
            decoration: InputDecoration(
              border: InputBorder.none,
              suffixIcon: _validate2
                  ? null
                  : Container(
                margin: EdgeInsets.only(top: 10),
                child: Image.asset(
                  'icons/success.png',
                  height: height,
                ),
              ),
            ),
          ),
        ),
      ],
    );

    final button = Container(
      width: 327,
      height: 62,
      child: RaisedButton(
        elevation: 0.0,
        child: Text(
          'СОХРАНИТЬ',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(31),
        ),
        padding: const EdgeInsets.all(15),
        color: Colors.pink,
        textColor: Colors.white,
        onPressed: () {
          _wrongPassword(context);
        },
      ),
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Center(
            child: ListView(
              children: <Widget>[
                SizedBox(height: 10),
                oldpassword,
                SizedBox(height: 10),
                newpassword,
                SizedBox(height: 10),
                repeatpassword,
                SizedBox(height: _overlap == 0 ? 250 : _overlap - 250),
                button,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
