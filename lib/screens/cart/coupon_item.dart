import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fuckingnum/styles/check-ou-product-styles.dart';

class IHaveCouponItem extends StatefulWidget {
  @override
  _IHaveCouponItemState createState() => _IHaveCouponItemState();
}

class _IHaveCouponItemState extends State<IHaveCouponItem> {
  double _couponButtonWidth;
  bool _couponButtonClicked = false;
  bool _couponButtonAnimationCompleted = false;
  Duration _duration = Duration(milliseconds: 250);
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
                                  controller: TextEditingController(),
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
                        ),
                      ),
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
