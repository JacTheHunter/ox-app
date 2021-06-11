import 'package:flutter/material.dart';
import 'package:fuckingnum/screens/more/add_new_card.dart';
import 'package:fuckingnum/styles/shipping-screen-styles.dart';
import 'package:fuckingnum/transitions/rightslide.dart';

class MyCards extends StatefulWidget {
  static const routeName = '/mycards-screen';

  @override
  _MyCardsState createState() => _MyCardsState();
}

class _MyCardsState extends State<MyCards> {
  bool _tapped1 = false;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      backgroundColor: Color(0xFFEBEFF9),
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xFF0D3662),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Мои карты оплаты',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Color(0xFF0D3662),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: width * .84,
            height: height * .13,
            margin: EdgeInsets.only(left: 35),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: width * .05),
                  width: width * .11,
                  height: height * .08,
                  decoration: BoxDecoration(
                    color: Color(0xFFECE1FE),
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: Center(
                    child: IconButton(
                      icon: Icon(
                        Icons.add,
                        size: 30,
                        color: Color(0xFF0D3662),
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
                  margin:
                  EdgeInsets.only(right: width * .05, left: width * .05),
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
                        style: ShippingScreenStyles
                            .getServiceTypeChargeTextStyle(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: height * .03),
          Container(
            width: width * .85,
            height: height * .13,
            margin: EdgeInsets.only(left: 35),
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
                          color: Color(0xFF0D3662),
                          fontWeight: FontWeight.w500,
                          fontSize: 15 / textScaleFactor,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            height: height * .03,
                            child: Image.asset(
                              'icons/uzcard1.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(' **** 1212')
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: width * .05),
                  width: width * .11,
                  height: height * .08,
                  decoration: BoxDecoration(
                    // color: Hexcolor("#78D35B"),
                      color: Color(0xFF78D35B),
                      borderRadius: BorderRadius.circular(11)),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _tapped1 = !_tapped1;
                      });
                    },
                    child: Center(
                        child: _tapped1 ? Icon(Icons.verified_user) : null),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
