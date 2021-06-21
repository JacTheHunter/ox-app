import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuckingnum/screens/authentication/phone/registration/otp_screen.dart';
import 'package:fuckingnum/styles/sign-up-style.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:io';

class ChangeProfile extends StatefulWidget {
  @override
  _ChangeProfile createState() => _ChangeProfile();
}

class _ChangeProfile extends State<ChangeProfile> {
  final _text = TextEditingController();
  bool _validate = true;

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  final picker = ImagePicker();
  File _image;

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
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
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
                  width: width,
                  height: height / 6,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            0, height * .015, width * .06, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            CloseButton(),
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
                      SizedBox(height: height * .02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              this.getImage(ImageSource.camera);
                            },
                            child: Container(
                              width: width * .35,
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
                          InkWell(
                            onTap: () {
                              this.getImage(ImageSource.gallery);
                            },
                            child: Container(
                              width: width * .35,
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
                        ],
                      ),
                      SizedBox(height: height * .09),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      );
    }

    final logo = Stack(
      alignment: Alignment.center,
      children: <Widget>[
        CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 68.0,
          child: Container(
            width: width * .50,
            height: height * .50,
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
    final name = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("ФИО", style: SignUpStyle.getLabelsTextStyle(textScaleFactor)),
        SizedBox(height: height * .02),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: height / 14,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
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
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: height / 14,
          child: TextField(
            keyboardType: TextInputType.phone,
            controller: _text,
            onChanged: (_) {
              setState(() {
                _text.text.isEmpty ? _validate = true : _validate = false;
              });
            },
            style: SignUpStyle.getInputFieldsTextStyle(textScaleFactor),
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              border: InputBorder.none,
              suffixIcon: _validate
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

    final email = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Email", style: SignUpStyle.getLabelsTextStyle(textScaleFactor)),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: height / 14,
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
          Navigator.push(
            context,
            new CupertinoPageRoute(builder: (context) => new OTPScreen()),
          );
        },
      ),
    );
    return Scaffold(
      backgroundColor: HexColor("#F7F8FB"),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: HexColor("#F7F8FB"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: HexColor("#0D3662"),
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
            color: HexColor("#0D3662"),
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
                SizedBox(height: 10),
                name,
                SizedBox(height: 10),
                phone_number,
                SizedBox(height: 10),
                email,
                SizedBox(height: 50),
                button
              ],
            ),
          ),
        ),
      ),
    );
  }
}
