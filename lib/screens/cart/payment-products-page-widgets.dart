import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fuckingnum/screens/more/add_new_card.dart';
import 'package:fuckingnum/styles/shipping-screen-styles.dart';
import 'package:fuckingnum/transitions/rightslide.dart';
import 'package:hexcolor/hexcolor.dart';

class AddNewCardWidget extends StatefulWidget {
  static double widgetHeight = .13;

  @override
  _AddNewCardWidgetState createState() => _AddNewCardWidgetState();
}

class _AddNewCardWidgetState extends State<AddNewCardWidget> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          SlideRightRoute(widget: NewCard()),
        );
      },
      child: Container(
        width: width * .82,
        height: height * .13,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: width * .05),
              width: width * .11,
              height: height * .08,
              decoration: BoxDecoration(
                  color: HexColor('#ECE1FE'),
                  borderRadius: BorderRadius.circular(11)),
              child: Center(
                child: IconButton(
                  icon: Icon(
                    Icons.add,
                    size: 30,
                    color: HexColor('#0D3662'),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      SlideRightRoute(widget: NewCard()),
                    );
                  },
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: width * .05, left: width * .05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Добавьте карту оплаты',
                    style: ShippingScreenStyles.getServiceTypeTextStyle(),
                  ),
                  Text(
                    'UzCard или Humo',
                    style: ShippingScreenStyles.getServiceTypeChargeTextStyle(),
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

class MyCardWidget extends StatefulWidget {
  static double widgetHeight = .13;

  @override
  _MyCardWidgetState createState() => _MyCardWidgetState();
}

class _MyCardWidgetState extends State<MyCardWidget> {
  bool _tapped1 = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Container(
      width: width * .85,
      height: height * .13,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: width * .05),
            width: width * .5,
            height: height * .08,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'UzCard Office',
                  style: TextStyle(
                    color: HexColor('#0D3662'),
                    fontWeight: FontWeight.w500,
                    fontSize: 14 / textScaleFactor,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Image.asset('icons/uzcard-small-icon.png'),
                    Text(' **** 1212')
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: width * .05),
            width: width * .11,
            height: height * .08,
            decoration: BoxDecoration(
                // color: Hexcolor("#78D35B"),
                borderRadius: BorderRadius.circular(11)),
            child: InkWell(
              onTap: (){
                setState(() {
                  _tapped1 = !_tapped1;
                });
              },
              child: Center(
                  child: _tapped1
                      ? SvgPicture.asset('icons/choosed.svg')
                      : SvgPicture.asset('icons/unchoosed.svg')),
            ),
          )
        ],
      ),
    );
  }
}
