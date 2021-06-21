/*
This widget for shipment,payment and place order pages
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fuckingnum/screens/cart/order-success-page.dart';
import 'package:fuckingnum/screens/cart/payment-products-page-widgets.dart';
import 'package:fuckingnum/screens/cart/shipping-products-page-widget.dart';
import 'package:fuckingnum/screens/models/cart_constructor.dart';
import 'package:fuckingnum/styles/shipping-screen-styles.dart';
import 'package:fuckingnum/transitions/fade_transition.dart';
import 'package:fuckingnum/widgets/RedButtonWidget.dart';
import 'package:fuckingnum/widgets/shipment-payment-place-order-page-widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import 'check_out_product_item.dart';

class ProductDeliveryPage extends StatefulWidget {
  @override
  _ProductDeliveryPageState createState() => _ProductDeliveryPageState();
}

class _ProductDeliveryPageState extends State<ProductDeliveryPage>
    with TickerProviderStateMixin {
  /*
  to manage designed Wrapper for
            ShipmentMethodsWidget(),
            ShipmentAddressWidget(),
            CommentaryAndAddAddressWidget(this._activeTopIndexBarIndex),
            AddNewCardWidget(),
            MyCardWidget(),
            ................
          ]
   */
  AnimationController _topWidgetBlockHeightAnimationController;
  Animation _topWidgetBlockHeightAnimation;

  /*
  0 - shipping_page
  1 - payment_page
  2 - place_order_page
   */
  int _activeTopIndexBarIndex;

  /*
  Page title
  Выберите способ доставки,
  Выберите способ оплаты
   */
  String _pageTitle;

  double _topWidgetBlockHeight;

  void _goToPlaceOrderPage() {
    setState(() {
      _pageTitle = '';
      double _currentHeight = _topWidgetBlockHeight;
      _activeTopIndexBarIndex = 2;
      _topWidgetBlockHeight = _getShipmentPageWidgetsTopBlockHeight();
      _topWidgetBlockHeightAnimation =
          Tween(begin: _currentHeight, end: _topWidgetBlockHeight).animate(
              CurvedAnimation(
                  parent: _topWidgetBlockHeightAnimationController,
                  curve: Curves.elasticOut));
      _topWidgetBlockHeightAnimationController.reset();
      _topWidgetBlockHeightAnimationController.forward();
    });
  }

  void _goToPaymentPage() {
    setState(() {
      _pageTitle = 'Выберите способ оплаты';
      double _currentHeight = _topWidgetBlockHeight;
      _activeTopIndexBarIndex = 1;
      _topWidgetBlockHeight = _getShipmentPageWidgetsTopBlockHeight();
      _topWidgetBlockHeightAnimation =
          Tween(begin: _currentHeight, end: _topWidgetBlockHeight).animate(
              CurvedAnimation(
                  parent: _topWidgetBlockHeightAnimationController,
                  curve: Curves.elasticOut));
      _topWidgetBlockHeightAnimationController.reset();
      _topWidgetBlockHeightAnimationController.forward();
    });
  }

  void _goToShippingPage() {
    setState(() {
      _pageTitle = 'Выберите способ доставки';
      double _currentHeight = _topWidgetBlockHeight;
      _activeTopIndexBarIndex = 0;
      _topWidgetBlockHeight = _getShipmentPageWidgetsTopBlockHeight();
      _topWidgetBlockHeightAnimationController.reset();
      _topWidgetBlockHeightAnimation =
          Tween(begin: _currentHeight, end: _topWidgetBlockHeight).animate(
              CurvedAnimation(
                  parent: _topWidgetBlockHeightAnimationController,
                  curve: Curves.elasticOut));
      _topWidgetBlockHeightAnimationController.reset();
      _topWidgetBlockHeightAnimationController.forward();
    });
  }

  void _indexBarOnChanged(int index) {
    if (index == 0) {
      _goToShippingPage();
    } else if (index == 1) {
      _goToPaymentPage();
    } else {
      _goToPlaceOrderPage();
    }
  }

  @override
  void initState() {
    super.initState();
    _activeTopIndexBarIndex = 0;
    _pageTitle = 'Выберите способ доставки';

    Future.delayed(Duration.zero, () {
      _topWidgetBlockHeight = _getShipmentPageWidgetsTopBlockHeight();
    });

    _topWidgetBlockHeightAnimationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _topWidgetBlockHeightAnimation =
        Tween(begin: _topWidgetBlockHeight, end: _topWidgetBlockHeight).animate(
            CurvedAnimation(
                parent: _topWidgetBlockHeightAnimationController,
                curve: Curves.elasticOut));
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
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
                        Navigator.pop(context);
                      },
                    ),
                  ],
                )),
            Container(
              margin: EdgeInsets.only(left: width * .05, right: width * .05),
              child: ShippingPaymentPlaceOrderAppBar(
                currentTabIndex: _activeTopIndexBarIndex,
                tabOnChange: this._indexBarOnChanged,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: width * .08, top: height * .03),
              child: CrossFade(
                initialData: _pageTitle,
                data: _pageTitle,
                builder: (data) => Text(data,
                    textScaleFactor: 1,
                    style: ShippingScreenStyles.getSelectShipmentTextStyle()),
              ),
            ),
            AnimatedBuilder(
              animation: this._topWidgetBlockHeightAnimation,
              builder: (context, child) => Container(
                width: width * .9,
                height: this._topWidgetBlockHeightAnimation.value,
                margin: EdgeInsets.only(
                    left: width * .05, right: width * .05, top: height * .02),
                padding: EdgeInsets.only(
                    left: width * .03,
                    right: width * .03,
                    top: height * .02,
                    bottom: height * .01),
                decoration: BoxDecoration(
                  color: HexColor('#EBF1FD'),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: _getShipmentPageWidgetsTopBlock(),
                  ),
                ),
              ),
            ),
            _getShipmentPageWidgetsBottomBlock(),
            SizedBox(
              height: height * .02,
            ),
            _getPaymentSummaryWidget(),
            _getBottomPinkButton(),
            SizedBox(
              height: height * .05,
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _getShipmentPageWidgetsTopBlock() {
    var height = MediaQuery.of(context).size.height;
    final cart = Provider.of<Cart>(context, listen: false);

    List<Container> _carts = [];

    cart.items.forEach((key, value) {
      _carts.add(Container(
        child: CheckoutProductItem(value),
        margin: EdgeInsets.only(bottom: height * .02),
      ));
    });

    return [
      CrossFade(
        initialData: this._activeTopIndexBarIndex,
        data: this._activeTopIndexBarIndex,
        builder: (data) => data == 0
            ? ShipmentMethodsWidget()
            : data == 1
                ? AddNewCardWidget()
                : cart.itemCount == 0
                    ? SizedBox.shrink()
                    : Column(
                        children: _carts,
                      ),
      ),
      SizedBox(
        height: height * .02,
      ),
      CrossFade(
        initialData: this._activeTopIndexBarIndex,
        data: this._activeTopIndexBarIndex,
        builder: (data) => data == 0
            ? ShipmentAddressWidget()
            : data == 1 ? MyCardWidget() : ShipmentAddressWidget(),
      ),
      SizedBox(
        height: height * .02,
      ),
      CrossFade(
        initialData: this._activeTopIndexBarIndex,
        data: this._activeTopIndexBarIndex,
        builder: (data) => data == 0
            ? Container()
            : data == 1 ? MyCardWidget() : MyCardWidget(),
      ),
      CrossFade(
        initialData:
        this._activeTopIndexBarIndex,
        data: this._activeTopIndexBarIndex,
        builder: (data) => data == 0
            ? CommentaryAndAddAddressWidget(this._activeTopIndexBarIndex)
            : Container(),
      )
    ];
  }

  Widget _getShipmentPageWidgetsBottomBlock() {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    Widget bottomBlock = Container(
      width: width * .9,
      height: height * .19,
      margin: EdgeInsets.only(
          left: width * .05, right: width * .05, top: height * .02),
      padding: EdgeInsets.only(
        left: width * .03,
        right: width * .03,
        top: height * .02,
      ),
      decoration: BoxDecoration(
        color: HexColor('#EBF1FD'),
        borderRadius: BorderRadius.circular(25),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[SelectDeliveryDate()],
        ),
      ),
    );
    return CrossFade(
      initialData: this._activeTopIndexBarIndex,
      data: this._activeTopIndexBarIndex,
      builder: (data) => data == 0 ? bottomBlock : Container(),
    );
  }

  Widget _getPaymentSummaryWidget() {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    final cart = Provider.of<Cart>(context, listen: false);

    var summary = Container(
      width: width * .9,
      height: height * .1,
      margin: EdgeInsets.only(
          left: width * .05, right: width * .05),
      padding: EdgeInsets.only(
          left: width * .03,
          right: width * .03,
          bottom: height * .01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Итого',
            textScaleFactor: 1,
            style: TextStyle(
              color: HexColor('#0D3662'),
              fontSize: 16,
            ),
          ),
          Text(
            '${cart.totalAmount} UZS',
            textScaleFactor: 1,
            style: TextStyle(
              color: HexColor('#0D3662'),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );

    return CrossFade(
      initialData: this._activeTopIndexBarIndex,
      data: this._activeTopIndexBarIndex,
      builder: (data) => data != 0 ? summary : SizedBox.shrink(),
    );
  }

  Widget _getBottomPinkButton() {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        if (_activeTopIndexBarIndex == 0) {
          _goToPaymentPage();
        } else if (_activeTopIndexBarIndex == 1) {
          _goToPlaceOrderPage();
        } else {
          Navigator.of(context).push(CupertinoPageRoute(
            builder: (context) => OrderSuccessPage(),
          ));
        }
      },
      child: Container(
        width: width,
        height: height * .1,
        child: Center(
          child: InkWell(
            child: AnimatedContainer(
                width: this._activeTopIndexBarIndex == 0
                    ? width * .6
                    : this._activeTopIndexBarIndex == 1
                        ? width * .35
                        : width * .6,
                duration: Duration(milliseconds: 500),
                child: CrossFade(
                  initialData: this._activeTopIndexBarIndex,
                  data: this._activeTopIndexBarIndex,
                  builder: (data) => data == 0
                      ? PinkButton('ОФОРМИТЬ ДОСТАВКУ')
                      : this._activeTopIndexBarIndex == 1
                          ? PinkButton('ОПЛАТИТЬ')
                          : PinkButton('ОПЛАТИТЬ И ЗАКАЗАТЬ'),
                )),
          ),
        ),
      ),
    );
  }

  double _getShipmentPageWidgetsTopBlockHeight() {
    final cart = Provider.of<Cart>(context, listen: false);

    var height = MediaQuery.of(context).size.height;
    return (this._activeTopIndexBarIndex == 0
            ? (ShipmentMethodsWidget.widgetHeightDivision +
                0.02 +
                ShipmentAddressWidget.widgetHeightDivision +
                CommentaryAndAddAddressWidget.widgetHeight)
            : this._activeTopIndexBarIndex == 1
                ? (AddNewCardWidget.widgetHeight +
                    2 * 0.02 +
                    2 * MyCardWidget.widgetHeight +
                    0.05)
                : (cart.itemCount * CheckoutProductItem.widgetHeight +
                    (cart.itemCount) * 0.02 +
                    ShipmentAddressWidget.widgetHeightDivision +
                    MyCardWidget.widgetHeight +
                    .1)) *
        height;
  }
}
