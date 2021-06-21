import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuckingnum/styles/sign-up-style.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../constants.dart';
import '../login_page.dart';
import 'otp_screen.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  File _image;
  final picker = ImagePicker();

  Future<String> _uploadImageToServer() async {
    //this method upload avatar photo to the server then returns back to the image URL
    //for now we show image itself from local storage
    return "";
  }

  Future getImage(ImageSource imageSource) async {
    try {
      final pickedFile = await picker.getImage(source: imageSource);

      setState(() {
        _image = File(pickedFile.path);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    void _addPhoto(context) {
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
              Expanded(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            0, height * .015, width * .06, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            CloseButton(
                              color: HexColor("#0D3662"),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: height * .01),
                      Text(
                        "Загрузить фото",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Montserrat',
                          fontSize: 19 / textScaleFactor,
                          color: HexColor('#0D3662'),
                        ),
                      ),
                      SizedBox(height: height * .05),
                      Row(
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              this.getImage(ImageSource.camera);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(left: width * .055),
                              child: Container(
                                width: width * .4,
                                height: height * .13,
                                decoration: BoxDecoration(
                                  color: HexColor("#EBF1FD"),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SvgPicture.asset('icons/camera.svg'),
                                    SizedBox(height: height * .0075),
                                    Text(
                                      "Снять фото",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14 / textScaleFactor,
                                        fontFamily: 'Montserrat',
                                        color: HexColor("#0D3662"),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: width * .08),
                          InkWell(
                            onTap: () {
                              this.getImage(ImageSource.gallery);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(right: width * .055),
                              child: Container(
                                width: width * .4,
                                height: height * .13,
                                decoration: BoxDecoration(
                                  color: HexColor("#EBF1FD"),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SvgPicture.asset('icons/galery.svg'),
                                    SizedBox(height: height * .0075),
                                    Text(
                                      "Галерея",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14 / textScaleFactor,
                                        fontFamily: 'Montserrat',
                                        color: HexColor("#0D3662"),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * .05),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      );
    }

    TextStyle defaultStyle = TextStyle(
        color: HexColor("#627285"),
        fontSize: 16.0 / textScaleFactor,
        fontWeight: FontWeight.w400,
        fontFamily: 'Montserrat');

    TextStyle linkStyle = TextStyle(
        color: HexColor("#0D3662"),
        fontSize: 16.0 / textScaleFactor,
        fontWeight: FontWeight.w600,
        fontFamily: 'Montserrat');

    final logo = Stack(
      alignment: Alignment.center,
      children: <Widget>[
        CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 68.0,
          child: Container(
            width: width * .9,
            height: height * .9,
            decoration: BoxDecoration(
              color: HexColor("#EBF1FD"),
              borderRadius: BorderRadius.circular(68),
              image: this._image == null
                  ? null
                  : DecorationImage(
                      image: FileImage(this._image),
                      fit: BoxFit.cover,
                    ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(width * .18, height * .13, 0, 0),
          child: RawMaterialButton(
            onPressed: () {
              _addPhoto(context);
            },
            elevation: 2.5,
            fillColor: Colors.white,
            child: ClipOval(
              child: Material(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(
                    Icons.add,
                  ),
                ),
              ),
            ),
            shape: CircleBorder(),
          ),
        ),
      ],
    );

    final password = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Пароль", style: SignUpStyle.getLabelsTextStyle2(textScaleFactor)),
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

    final repeat_password = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Повторите пароль",
            style: SignUpStyle.getLabelsTextStyle2(textScaleFactor)),
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

    final name = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("ФИО", style: SignUpStyle.getLabelsTextStyle(textScaleFactor)),
        SizedBox(height: height * .02),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: height * .075,
          child: TextField(
            keyboardType: TextInputType.text,
            style: SignUpStyle.getInputFieldsTextStyle(textScaleFactor),
            textAlign: TextAlign.center,
            decoration: SignUpStyle.getInputFieldsDecoration(),
          ),
        ),
      ],
    );

    final phone_number = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Номер телефона",
            style: SignUpStyle.getLabelsTextStyle(textScaleFactor)),
        SizedBox(height: height * .02),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: height * .075,
          child: TextField(
            keyboardType: TextInputType.phone,
            style: SignUpStyle.getInputFieldsTextStyle(textScaleFactor),
            textAlign: TextAlign.center,
            decoration: SignUpStyle.getInputFieldsDecoration(),
          ),
        ),
      ],
    );

    final email = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Email", style: SignUpStyle.getLabelsTextStyle(textScaleFactor)),
        SizedBox(height: height * .02),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: height * .075,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: SignUpStyle.getInputFieldsTextStyle(textScaleFactor),
            textAlign: TextAlign.center,
            decoration: SignUpStyle.getInputFieldsDecoration(),
          ),
        ),
      ],
    );

    final button = Container(
      width: width,
      height: height * .080,
      child: RaisedButton(
        elevation: 0.0,
        child: Text('ДАЛЕЕ',
            style: SignUpStyle.getButtonTextStyle(textScaleFactor)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(31),
        ),
        padding: const EdgeInsets.all(15),
        color: Colors.pink,
        textColor: Colors.white,
        onPressed: () {
          Navigator.push(context,
              new CupertinoPageRoute(builder: (context) => new OTPScreen()));
        },
      ),
    );

    return Scaffold(
      backgroundColor: HexColor("#F7F8FB"),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: HexColor("#F7F8FB"),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: HexColor("#0D3662"),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text("Регистрация",
            style: SignUpStyle.getAppBarTextStyle(textScaleFactor)),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Center(
            child: ListView(
              children: <Widget>[
                logo,
                SizedBox(height: height * .01),
                name,
                SizedBox(height: height * .02),
                phone_number,
                SizedBox(height: height * .02),
                email,
                SizedBox(height: height * .02),
                password,
                SizedBox(height: height * .02),
                repeat_password,
                SizedBox(height: height * .02),
                button,
                SizedBox(height: height * .02),
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: defaultStyle,
                        children: <TextSpan>[
                          TextSpan(text: 'У меня есть аккаунт.'),
                          TextSpan(
                            text: 'Войти',
                            style: linkStyle,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  new CupertinoPageRoute(
                                      builder: (context) => new LoginPage()),
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, height * .01, 0, 0),
                      child: Container(
                        width: width * .58,
                        height: height * .01,
                        color: HexColor("#965EFF").withOpacity(0.2),
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
