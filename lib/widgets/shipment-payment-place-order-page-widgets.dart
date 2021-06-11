import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ShippingPaymentPlaceOrderAppBar extends StatefulWidget {
  final Function tabOnChange;
  final int currentTabIndex;

  ShippingPaymentPlaceOrderAppBar(
      {@required this.currentTabIndex, @required this.tabOnChange});

  @override
  _ShippingPaymentPlaceOrderAppBarState createState() =>
      _ShippingPaymentPlaceOrderAppBarState();
}

class _ShippingPaymentPlaceOrderAppBarState
    extends State<ShippingPaymentPlaceOrderAppBar>
    with TickerProviderStateMixin {
  int currentIndex;

  double selectedWi;
  double animationBackgroundX = -1;
  bool _backgroundAnimationCompleted = true;
  double selectedTabTextOpacity = 1;

  List<double> widths;

  Widget _getItem(String text, IconData icon, BuildContext context, int index) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    if (currentIndex == index) {
      return _getSelectedItem(text, icon, context, index);
    }
    return InkWell(
      onTap: () {
        widget.tabOnChange(index);
      },
      child: Container(
        width: width * .16,
        height: height * .09,
        child: Icon(icon),
      ),
    );
  }

  _checkAnimation() {
    currentIndex = widget.currentTabIndex;
    this.animationBackgroundX =
        currentIndex == 0 ? -1 : currentIndex == 1 ? -.0 : 1;
    print('position ${animationBackgroundX.toString()}');
    print("Current index $currentIndex \n\n");
    setState(() {
      this._backgroundAnimationCompleted = false;
    });
  }

  Widget _getSelectedItem(
      String text, IconData icon, BuildContext context, int index) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return AnimatedContainer(
      height: height * .07,
      width: selectedWi,
      decoration: BoxDecoration(
        color: Hexcolor('#FFEBF3'),
        borderRadius: BorderRadius.circular(35),
      ),
      duration: Duration(milliseconds: 200),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: (width) / 10,
            height: height * .035,
            child: Icon(
              icon,
              color: Colors.pink,
            ),
          ),
          AnimatedOpacity(
            duration: Duration(milliseconds: 100),
            opacity: this.selectedTabTextOpacity,
            child: Text(
              text,
              textScaleFactor: 1,
              style: TextStyle(
                color: Colors.pinkAccent,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _getSwapperAnimationWidget(
    double width,
    double height,
  ) {
    return Container(
      height: height * .07,
      width: selectedWi,
      decoration: BoxDecoration(
        color: Hexcolor('#FFEBF3'),
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentTabIndex;
    this.animationBackgroundX =
        currentIndex == 0 ? -1 : currentIndex == 0 ? -.8 : 1;
    widths = [];
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var scaleFactor = MediaQuery.of(context).textScaleFactor.toDouble();

    selectedWi = width * .5;
    _checkAnimation();
    return Container(
      width: width * .9,
      height: height * .09,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(35),
      ),
      child: Container(
        width: width * .9,
        padding: EdgeInsets.only(left: width * .02, right: width * .02),
        child: Center(
          child: Container(
            width: width,
            child: Stack(
              children: <Widget>[
                Container(
                  width: width * .9,
                  child: Stack(
                    children: <Widget>[
                      AnimatedAlign(
                        child: _getSwapperAnimationWidget(width, height),
                        alignment: Alignment(this.animationBackgroundX, 0),
                        duration: Duration(milliseconds: 250),
                        onEnd: () {
                          if (!this._backgroundAnimationCompleted) {
                            setState(() {
                              this._backgroundAnimationCompleted = true;
                              this.selectedTabTextOpacity = 1.0;
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ),
                Align(
                  child: Container(
                    width: width * .9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        _getItem('Доставка', Icons.local_shipping, context, 0),
                        _getItem('Оплата', Icons.payment, context, 1),
                        _getItem('Подверждение', Icons.check_circle_outline,
                            context, 2),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
