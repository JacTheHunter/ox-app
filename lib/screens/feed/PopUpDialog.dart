import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PopUpDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      backgroundColor: Colors.white,
      child: Container(
        height: height / 1.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          children: <Widget>[
            Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Container(
                  height: height / 2.56,
                  width: width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/popup.png'),
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                Positioned(
                  left: width / 1.4,
                  top: height / 50,
                  child: Container(
                    height: height / 30,
                    child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: SvgPicture.asset('icons/close.svg' , height: height / 40,)),
                  ),
                ),
                Positioned(
                  left: width / 4.7,
                  right: width / 4.7,
                  top: height / 2.8,
                  child: Container(
                    height: height / 14,
                    width: width / 2.5,
                    child: RaisedButton(
                      color: Color(0xFFFF2D87),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(31),
                      ),
                      onPressed: () {},
                      child: Text(
                        'ПОЛУЧИТЬ',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 16 / textScaleFactor,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: height * .055),
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Получите купон на сумму',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 16 / textScaleFactor,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF627285),
                      ),
                    ),
                    TextSpan(
                      text: '\n 100 000 UZS',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 16 / textScaleFactor,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF627285),
                      ),
                    ),
                    TextSpan(
                      text: ' для одежд',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 16 / textScaleFactor,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF627285),
                      ),
                    ),
                    TextSpan(
                      text: '\n     бренда',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 16 / textScaleFactor,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF627285),
                      ),
                    ),
                    TextSpan(
                      text: ' HUGO BOSS',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 16 / textScaleFactor,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF627285),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
