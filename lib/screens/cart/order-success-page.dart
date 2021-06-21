import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuckingnum/screens/more/mybuys/mybuys.dart';
import 'package:fuckingnum/widgets/RedButtonWidget.dart';
import 'package:hexcolor/hexcolor.dart';

class OrderSuccessPage extends StatefulWidget {
  @override
  _OrderSuccessPageState createState() => _OrderSuccessPageState();
}

class _OrderSuccessPageState extends State<OrderSuccessPage> {
  void _closePage() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      body: Container(
        width: width,
        height: height,
        color: HexColor('#F7F8FB'),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  width: width,
                  height: height * .1,
                  padding: EdgeInsets.only(top: height * .05),
                  margin: EdgeInsets.only(bottom: height * .01),
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: width * .03,
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.close,
                          color: HexColor("#0D3662"),
                          size: 30,
                        ),
                        onPressed: () {
                          this._closePage();
                        },
                      ),
                    ],
                  )),
              Container(
                margin:
                    EdgeInsets.only(top: height * .05, bottom: height * .05),
                width: width,
                child: Center(
                  child: SvgPicture.asset('images/order-success-image.svg'),
                ),
              ),
              Center(
                child: Text(
                  'Оплата прошла успешно',
                  style: TextStyle(
                    color: HexColor('#0D3662'),
                    fontWeight: FontWeight.w600,
                    fontSize: 19 / textScaleFactor,
                  ),
                ),
              ),
              Container(
                width: width,
                padding: EdgeInsets.only(
                    left: width * .05,
                    right: width * .05,
                    top: height * .03,
                    bottom: height * .03),
                child: Center(
                  child: Text(
                    'Ваша оплата прошла успешно, для того что бы проследить за своим заказов перейдите в “Мои покупки”',
                    style: TextStyle(
                      color: HexColor('#627285'),
                      fontSize: 16 / textScaleFactor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => MyBuys(),
                      ));
                },
                child: Container(
                  width: width,
                  height: height * .1,
                  child: Center(
                    child: InkWell(
                      child: Container(
                          width: width * .7, child: PinkButton('МОИ ПОКУПКИ')),
                    ),
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
