import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuckingnum/styles/shipping-screen-styles.dart';
import 'package:hexcolor/hexcolor.dart';

class ShipmentMethodsWidget extends StatefulWidget {
  static double widgetHeightDivision = .13;

  @override
  _ShipmentMethodsWidgetState createState() => _ShipmentMethodsWidgetState();
}

class _ShipmentMethodsWidgetState extends State<ShipmentMethodsWidget> {
  List<String> delivery = [
    'Быстрая доставка',
    'Обычная доставка',
    'Акмаль-доставка',
  ];
  String selectedRadio;
  String wayOfDelivery;

  @override
  void initState() {
    selectedRadio = null;
    super.initState();
  }

  setSelectedRadio(String val) {
    selectedRadio = val;
  }

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
                  style: ShippingScreenStyles.getServiceTypeTextStyle(),
                ),
                Text(
                  'Срочная доставка',
                  style: ShippingScreenStyles.getServiceTypeChargeTextStyle(),
                ),
                Text(
                  '+35 000 UZS',
                  style: ShippingScreenStyles.getServiceTypeChargeTextStyle(),
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
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => Dialog(
                      child: StatefulBuilder(
                        builder: (BuildContext ct, StateSetter setState) =>
                            Container(
                          height: height * 0.4,
                          child: Column(
                            children: [
                              SizedBox(height: height * .05),
                              Text(
                                'Методы доставки',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20 / textScaleFactor,
                                ),
                              ),
                              SizedBox(height: height * .03),
                              RadioListTile(
                                title: Text(delivery[0]),
                                value: delivery[0],
                                groupValue: selectedRadio,
                                onChanged: (value) {
                                  setState(() {
                                    wayOfDelivery = value;
                                    print(wayOfDelivery);
                                    setSelectedRadio(value);
                                  });
                                },
                              ),
                              RadioListTile(
                                title: Text(delivery[1]),
                                value: delivery[1],
                                groupValue: selectedRadio,
                                onChanged: (value) {
                                  setState(() {
                                    wayOfDelivery = value;
                                    print(wayOfDelivery);
                                    setSelectedRadio(value);
                                  });
                                },
                              ),
                              RadioListTile(
                                title: Text(delivery[2]),
                                value: delivery[2],
                                groupValue: selectedRadio,
                                onChanged: (value) {
                                  setState(() {
                                    wayOfDelivery = value;
                                    print(wayOfDelivery);
                                    setSelectedRadio(value);
                                  });
                                },
                              ),
                              Container(
                                alignment: Alignment.centerRight,
                                child: FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Закрыть'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ShipmentAddressWidget extends StatefulWidget {
  static double widgetHeightDivision = .15;

  @override
  _ShipmentAddressWidgetState createState() => _ShipmentAddressWidgetState();
}

class _ShipmentAddressWidgetState extends State<ShipmentAddressWidget> {
  List<String> items = [
    'One',
    'Two',
    'Three',
    'Four',
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Container(
      width: width * .85,
      height: height * .15,
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
                  style: ShippingScreenStyles.getServiceTypeTextStyle(),
                ),
                Container(
                  width: width * .4,
                  child: Text(
                    'г.Ташкент, ул. Айбек,'
                    ' дом 40, этаж 2, кв. 4',
                    maxLines: 2,
                    style: ShippingScreenStyles.getServiceTypeChargeTextStyle(),
                  ),
                ),
              ],
            ),
          ),
          PopupMenuButton(
            itemBuilder: (_) => [
              PopupMenuItem(
                value: items[0],
                child: Text('One'),
              ),
              PopupMenuItem(
                value: items[1],
                child: Text('Two'),
              ),
              PopupMenuItem(
                value: items[2],
                child: Text('Three'),
              ),
            ],
            icon: SvgPicture.asset("icons/settings1.svg"),
            onSelected: (value) {
              print(value);
            },

            //InkWell(
            //  onTap: (){},
            //  child: Container(
            //    margin: EdgeInsets.only(right: width * .05),
            //    width: width * .11,
            //    height: height * .08,
            //    child: Center(child: SvgPicture.asset("icons/settings1.svg")),
            //  ),
            //),
          ),
        ],
      ),
    );
  }
}

class SelectDeliveryDate extends StatefulWidget {
  /*
  this variable indicates only widget height without margin or padding
   */
  static double widgetHeightDivision = .15;

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
                    style: ShippingScreenStyles.getServiceTypeTextStyle(),
                  ),
                ),
                Container(
                  width: width * .4,
                  child: Text(
                    'завтра 10:00 - 15:00',
                    maxLines: 2,
                    style: ShippingScreenStyles.getServiceTypeChargeTextStyle(),
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

class CommentaryAndAddAddressWidget extends StatelessWidget {
  static double widgetHeight = .1;

  final int _activeTopIndexBarIndex;

  CommentaryAndAddAddressWidget(this._activeTopIndexBarIndex);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return this._activeTopIndexBarIndex != 0
        ? SizedBox.shrink()
        : Container(
            height: height * .04,
            margin: EdgeInsets.only(
              left: width * .01,
              right: width * .01,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SvgPicture.asset("icons/message.svg"),
                    SizedBox(
                      width: width * .02,
                    ),
                    Text(
                      'Комментарии',
                      textScaleFactor: 1,
                      style: ShippingScreenStyles.getServiceTypeTextStyle(),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    SvgPicture.asset("icons/add.svg"),
                    SizedBox(
                      width: width * .02,
                    ),
                    Text(
                      'Адрес',
                      textScaleFactor: 1,
                      style: ShippingScreenStyles.getServiceTypeTextStyle(),
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}
