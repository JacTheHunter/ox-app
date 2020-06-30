import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuckingnum/styles/check-ou-product-styles.dart';
import 'package:fuckingnum/widgets/RedButtonWidget.dart';
import 'package:hexcolor/hexcolor.dart';

class CheckOutProductPage extends StatefulWidget {
  @override
  _CheckOutProductPageState createState() => _CheckOutProductPageState();
}

class _CheckOutProductPageState extends State<CheckOutProductPage> {
  void _closeCheckOutProductPage() {}

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Container(
      width: width,
      height: height,
      color: Hexcolor('#F7F8FB'),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                width: width,
                height: height * .15,
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: width * .03,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Colors.black54,
                        size: 30,
                      ),
                      onPressed: () {
                        this._closeCheckOutProductPage();
                      },
                    ),
                  ],
                )),
            CheckoutProductItem(
              imagePath: 'images/checked-out-product-2.png',
              color: Hexcolor('#FF8A3D'),
              price: 890000,
            ),
            SizedBox(
              height: height * .03,
            ),
            CheckoutProductItem(
              imagePath: 'images/checked-out-product-2.png',
              color: Hexcolor('#FF8A3D'),
              price: 890000,
            ),
            SizedBox(
              height: height * .03,
            ),
            Container(
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  IHaveCouponItem(),
                ],
              ),
            ),
            SizedBox(
              height: height * .03,
            ),
            SummaryProducts()
          ],
        ),
      ),
    );
  }
}

class CheckoutProductItem extends StatefulWidget {
  String imagePath;
  Color color;
  int price;

  CheckoutProductItem({this.imagePath, this.color, this.price});

  @override
  _CheckoutProductItemState createState() => _CheckoutProductItemState();
}

class _CheckoutProductItemState extends State<CheckoutProductItem> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Container(
      width: width * .9,
      height: height * .23,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: width * .05,
          ),
          Image.asset(
            widget.imagePath,
            width: width * .2,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: width * .04,
          ),
          Container(
            width: width * .47,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Belt suit blazer',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                    fontSize: 16 / textScaleFactor,
                    color: Hexcolor('#0D3662'),
                  ),
                ),
                Text(
                  'ZF876',
                  style: TextStyle(
                      color: Hexcolor('#627285'),
                      fontSize: 14 / textScaleFactor,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Montserrat'),
                ),
                SizedBox(
                  height: height * .01,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Color',
                      style: TextStyle(
                        color: Hexcolor('#0D3662'),
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        fontSize: 14 / textScaleFactor,
                      ),
                    ),
                    SizedBox(
                      width: width * .01,
                    ),
                    Container(
                      width: width * .03,
                      height: width * .03,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width * .03),
                        color: widget.color,
                      ),
                    ),
                    SizedBox(
                      width: width * .03,
                    ),
                    Text(
                      'XL',
                      style: TextStyle(
                        color: Hexcolor('#0D3662'),
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        fontSize: 14 / textScaleFactor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * .03,
                ),
                Text(
                  '1x 890 000 UZS',
                  style: TextStyle(
                    color: Hexcolor('#0D3662'),
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                    fontSize: 20 / textScaleFactor,
                  ),
                )
              ],
            ),
          ),
          Container(
            width: width * .11,
            height: height * .1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Hexcolor('#EBF1FD'),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: width * .13,
                  height: height * .05,
                  child: IconButton(
                    icon: Icon(
                      Icons.add,
                      size: 20,
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                  width: width * .13,
                  height: height * .05,
                  child: IconButton(
                    icon: Icon(
                      Icons.remove,
                      size: 20,
                    ),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class IHaveCouponItem extends StatefulWidget {
  @override
  _IHaveCouponItemState createState() => _IHaveCouponItemState();
}

class _IHaveCouponItemState extends State<IHaveCouponItem> {
  double _couponButtonWidth;
  bool _couponButtonClicked;
  bool _couponButtonAnimationCompleted;
  Duration _duration;
  double _ihaveCouponTextOpacity = 1;
  double _ihaveCouponTexFieldOpacity = 0;

  void _iHaveCouponClicked() {
    setState(() {
      this._couponButtonClicked = true;
      this._ihaveCouponTextOpacity = 0;
    });
  }

  @override
  void initState() {
    _couponButtonClicked = false;
    _couponButtonAnimationCompleted = false;
    _duration = Duration(milliseconds: 250);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    if (this._couponButtonClicked) {
      this._couponButtonWidth = width * .9;
    } else {
      this._couponButtonWidth = width * .52;
    }

    return InkWell(
      onTap: this._iHaveCouponClicked,
      child: AnimatedContainer(
        duration: this._duration,
        margin: EdgeInsets.only(left: width * .05),
        width: this._couponButtonWidth,
        height: height * .08,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
        ),
        child: Stack(
          children: <Widget>[
            Align(
              child: AnimatedOpacity(
                opacity: this._ihaveCouponTextOpacity,
                duration: this._duration,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SvgPicture.asset(
                      'images/i-have-coupon-button-icon.svg',
                      width: width * .09,
                    ),
                    SizedBox(
                      width: width * .02,
                    ),
                    Text(
                      'У меня есть купон',
                      style: CheckOutProductPageStyles.getIHaveCouponButtonText(
                          textScaleFactor),
                    )
                  ],
                ),
              ),
            ),
            Align(
              child: AnimatedOpacity(
                opacity: 1 - this._ihaveCouponTextOpacity,
                duration: this._duration,
                onEnd: () {
                  if (this._couponButtonClicked) {
                    setState(() {
                      this._couponButtonAnimationCompleted = true;
                      this._ihaveCouponTexFieldOpacity = 1;
                    });
                  }
                },
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: width * .6,
                        height: height * .08,
                        child: this._couponButtonAnimationCompleted
                            ? AnimatedOpacity(
                                opacity: _ihaveCouponTexFieldOpacity,
                                duration: this._duration,
                                child: TextField(
                                  cursorColor: Colors.transparent,
                                  decoration: CheckOutProductPageStyles
                                      .getCouponTextInputDecoration(
                                          textScaleFactor),
                                ),
                              )
                            : SizedBox.shrink(),
                      ),
                      SizedBox(
                        width: width * .02,
                      ),
                      AnimatedOpacity(
                          opacity: _ihaveCouponTexFieldOpacity,
                          duration: this._duration,
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_forward,
                              color: Colors.black,
                              size: 30,
                            ),
                            onPressed: () {},
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SummaryProducts extends StatefulWidget {
  @override
  _SummaryProductsState createState() => _SummaryProductsState();
}

class _SummaryProductsState extends State<SummaryProducts> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Container(
      width: width,
      height: height * .5,
      padding: EdgeInsets.only(
        left: width * .05,
        right: width * .05,
        top: height * .1,
      ),
      decoration: BoxDecoration(
          color: Hexcolor('#0D3662'),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Подитог',
                style: CheckOutProductPageStyles.getSummaryTextStyles(
                    textScaleFactor),
              ),
              Text(
                '3 780 000 UZS',
                style: CheckOutProductPageStyles.getSummaryTextStyles(
                    textScaleFactor),
              ),
            ],
          ),
          SizedBox(
            height: height * .03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Доставка',
                style: CheckOutProductPageStyles.getSummaryTextStyles(
                    textScaleFactor),
              ),
              Text(
                '0 UZS',
                style: CheckOutProductPageStyles.getSummaryTextStyles(
                    textScaleFactor),
              ),
            ],
          ),
          SizedBox(
            height: height * .05,
          ),
          Divider(
            height: 2,
            color: Color.fromARGB((255 * 0.397481).toInt(), 255, 255, 255),
            thickness: 2,
            endIndent: 2,
            indent: 2,
          ),
          SizedBox(
            height: height * .06,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Итого',
                style: CheckOutProductPageStyles.getSummaryTextStyles(
                    textScaleFactor),
              ),
              Text(
                '3 780 000 UZS',
                style: CheckOutProductPageStyles.getFinalSummaryTextStyles(
                    textScaleFactor),
              ),
            ],
          ),
          SizedBox(
            height: height * .06,
          ),
          InkWell(
            child: PinkButton('ОФОРМИТЬ ЗАКАЗ'),
          )
        ],
      ),
    );
  }
}
