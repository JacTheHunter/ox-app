import 'package:flutter/material.dart';
import 'package:fuckingnum/styles/shipping-screen-styles.dart';
import 'package:fuckingnum/widgets/RedButtonWidget.dart';
import 'package:fuckingnum/widgets/shipment-payment-place-order-page-widgets.dart';
import 'package:hexcolor/hexcolor.dart';

class ShippingProducts extends StatefulWidget {
  @override
  _ShippingProductsState createState() => _ShippingProductsState();
}

class _ShippingProductsState extends State<ShippingProducts> {
  void _closeShippingProductPage() {}

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
                        color: Colors.black54,
                        size: 30,
                      ),
                      onPressed: () {
                        this._closeShippingProductPage();
                      },
                    ),
                  ],
                )),
            Container(
              margin: EdgeInsets.only(left: width * .05, right: width * .05),
              child: ShippingPaymentPlaceOrderAppBar(activeIndex: 0),
            ),
            Container(
              margin: EdgeInsets.only(left: width * .08, top: height * .03),
              child: Text(
                'Выберите способ доставки',
                style: ShippingScreenStyles.getSelectShipmentTextStyle(
                    textScaleFactor),
              ),
            ),
            Container(
              width: width * .9,
              height: height * .4,
              margin: EdgeInsets.only(
                  left: width * .05, right: width * .05, top: height * .02),
              padding: EdgeInsets.only(
                  left: width * .03,
                  right: width * .03,
                  top: height * .02,
                  bottom: height * .01),
              decoration: BoxDecoration(
                color: Hexcolor('#EBF1FD'),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                children: <Widget>[
                  ShipmentMethodsWidget(),
                  ShipmentAddressWidget(),
                  Container(
                    margin: EdgeInsets.only(
                        top: height * .02,
                        left: width * .01,
                        right: width * .01),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.insert_comment,
                            ),
                            SizedBox(
                              width: width * .02,
                            ),
                            Text(
                              'Комментарии',
                              style:
                                  ShippingScreenStyles.getServiceTypeTextStyle(
                                      textScaleFactor),
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.add_circle,
                              color: Hexcolor('#965EFF'),
                            ),
                            SizedBox(
                              width: width * .02,
                            ),
                            Text(
                              'Адрес',
                              style:
                                  ShippingScreenStyles.getServiceTypeTextStyle(
                                      textScaleFactor),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: width * .9,
              height: height * .19,
              margin: EdgeInsets.only(
                  left: width * .05, right: width * .05, top: height * .02),
              padding: EdgeInsets.only(
                left: width * .03,
                right: width * .03,
              ),
              decoration: BoxDecoration(
                color: Hexcolor('#EBF1FD'),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                children: <Widget>[SelectDeliveryDate()],
              ),
            ),
            SizedBox(
              height: height * .05,
            ),
            Container(
              width: width,
              height: height * .1,
              child: Center(
                child: InkWell(
                  child: PinkButton('ОФОРМИТЬ ДОСТАВКУ'),
                ),
              ),
            ),
            SizedBox(
              height: height * .05,
            ),
          ],
        ),
      ),
    );
  }
}

class ShipmentMethodsWidget extends StatefulWidget {
  @override
  _ShipmentMethodsWidgetState createState() => _ShipmentMethodsWidgetState();
}

class _ShipmentMethodsWidgetState extends State<ShipmentMethodsWidget> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Container(
      width: width * .82,
      height: height * .13,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: width * .05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Метод доставки',
                  style: ShippingScreenStyles.getServiceTypeTextStyle(
                      textScaleFactor),
                ),
                Text(
                  'Срочная доставка',
                  style: ShippingScreenStyles.getServiceTypeChargeTextStyle(
                      textScaleFactor),
                ),
                Text(
                  '+35 000 UZS',
                  style: ShippingScreenStyles.getServiceTypeChargeTextStyle(
                      textScaleFactor),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: width * .05),
            width: width * .11,
            height: height * .08,
            decoration: BoxDecoration(
                color: Hexcolor('#ECE1FE'),
                borderRadius: BorderRadius.circular(11)),
            child: Center(
              child: IconButton(
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  size: 30,
                  color: Hexcolor('#965EFF'),
                ),
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ShipmentAddressWidget extends StatefulWidget {
  @override
  _ShipmentAddressWidgetState createState() => _ShipmentAddressWidgetState();
}

class _ShipmentAddressWidgetState extends State<ShipmentAddressWidget> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Container(
      width: width * .82,
      height: height * .15,
      margin: EdgeInsets.only(top: height * .02),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: width * .05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Адрес доставки',
                  style: ShippingScreenStyles.getServiceTypeTextStyle(
                      textScaleFactor),
                ),
                Container(
                  width: width * .4,
                  child: Text(
                    'г.Ташкент, ул. Айбек,'
                    ' дом 40, этаж 2, кв. 4',
                    maxLines: 2,
                    style: ShippingScreenStyles.getServiceTypeChargeTextStyle(
                        textScaleFactor),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: width * .05),
            width: width * .11,
            height: height * .08,
            child: Center(
              child: IconButton(
                icon: Icon(
                  Icons.home,
                  size: 30,
                ),
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SelectDeliveryDate extends StatefulWidget {
  @override
  _SelectDeliveryDateState createState() => _SelectDeliveryDateState();
}

class _SelectDeliveryDateState extends State<SelectDeliveryDate> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Container(
      width: width * .82,
      height: height * .15,
      margin: EdgeInsets.only(top: height * .02),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: width * .05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: width * .4,
                  child: Text(
                    'Выберите удобное для Вас время',
                    style: ShippingScreenStyles.getServiceTypeTextStyle(
                        textScaleFactor),
                  ),
                ),
                Container(
                  width: width * .4,
                  child: Text(
                    'завтра 10:00 - 15:00',
                    maxLines: 2,
                    style: ShippingScreenStyles.getServiceTypeChargeTextStyle(
                        textScaleFactor),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: width * .05),
            width: width * .11,
            height: height * .08,
            decoration: BoxDecoration(
                color: Hexcolor('#ECE1FE'),
                borderRadius: BorderRadius.circular(11)),
            child: Center(
              child: IconButton(
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  size: 30,
                  color: Hexcolor('#965EFF'),
                ),
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
    );
  }
}
