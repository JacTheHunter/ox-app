import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fuckingnum/screens/authentication/phone/registration/signup_screen.dart';
import 'package:fuckingnum/screens/authentication/phone/success_screen.dart';
import 'package:fuckingnum/styles/sign-up-style.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../constants.dart';
import '../../../widgets/reusableButton.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    TextStyle defaultStyle = TextStyle(
        color: Hexcolor("#627285"),
        fontSize: 15.0 / textScaleFactor,
        fontWeight: FontWeight.w400,
        fontFamily: 'Montserrat');
    TextStyle linkStyle = TextStyle(
        color: Hexcolor("#0D3662"),
        fontSize: 16.0 / textScaleFactor,
        fontWeight: FontWeight.w600,
        fontFamily: 'Montserrat');

    final logo = CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 68.0,
      child: Image.asset('icons/profile.png'),
    );

    final password = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("Пароль",
                style: SignUpStyle.getLabelsTextStyle(textScaleFactor)),
            Text(
              "Забыли?",
              style: TextStyle(
                fontSize: 16 / textScaleFactor,
                fontWeight: FontWeight.w500,
                fontFamily: 'Montserrat',
                color: Hexcolor("#965EFF"),
              ),
            ),
          ],
        ),
        SizedBox(height: height * .02),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: height * .075,
          child: TextField(
            obscureText: true,
            style: SignUpStyle.getInputFieldsTextStyle(textScaleFactor),
            textAlign: TextAlign.center,
            decoration: SignUpStyle.getInputFieldsDecoration(),
          ),
        ),
      ],
    );

    final login = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Номер телефона или email",
            style: SignUpStyle.getLabelsTextStyle(textScaleFactor)),
        SizedBox(height: height * .02),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: height * .075,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            textAlign: TextAlign.center,
            style: SignUpStyle.getInputFieldsTextStyle(textScaleFactor),
            decoration: SignUpStyle.getInputFieldsDecoration(),
          ),
        ),
      ],
    );

    final button = ReusableButton(
      width: width,
      height: height * 0.8,
      textScaleFactor: textScaleFactor,
      onPressed: () {
        Navigator.push(context,
            new CupertinoPageRoute(builder: (context) => new SuccessScreen()));
      },
      text: 'ДАЛЕЕ',
      fontsize: 16,
      fontWeight: FontWeight.w600,
      padding: const EdgeInsets.all(15),
    );

    return Scaffold(
      backgroundColor: Hexcolor("#F7F8FB"),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Hexcolor("#F7F8FB"),
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
          "Войти",
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500,
            fontSize: 19.0 / textScaleFactor,
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
                logo,
                SizedBox(height: height * .05),
                login,
                SizedBox(height: height * .04),
                password,
                SizedBox(height: height * .05),
                button,
                SizedBox(height: height * .03),
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: defaultStyle,
                        children: <TextSpan>[
                          TextSpan(text: 'У меня нету аккаунта.'),
                          TextSpan(
                            text: 'Регистрация',
                            style: linkStyle,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  new CupertinoPageRoute(
                                      builder: (context) => new SignUpPage()),
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, width * .015, 0, 0),
                      child: Container(
                        width: width * .7,
                        height: height * .01,
                        color: Hexcolor("#965EFF").withOpacity(0.2),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
