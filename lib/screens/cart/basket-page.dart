import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuckingnum/styles/basket-page-styles.dart';
import 'package:fuckingnum/widgets/RedButtonWidget.dart';
import 'package:flutter/cupertino.dart';

import '../catalog/catalog.dart';

class BasketPage extends StatefulWidget {
  @override
  _BasketPageState createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  void _openProductCatalog() {}

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: width,
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: height * .04,
              ),
              SvgPicture.asset(
                'images/basket-page-welcome-girl.svg',
                width: width * .8,
              ),
              SizedBox(
                height: height * .07,
              ),
              Text(
                'Ваша корзина пуста',
                textAlign: TextAlign.center,
                style: BasketPageStyles.getBasketPageWelcomeText1Style(
                    textScaleFactor),
              ),
              SizedBox(
                height: height * .02,
              ),
              Text(
                'Откройте для себя что-то новое,\n чтобы обновить свой шкаф',
                textAlign: TextAlign.center,
                style: BasketPageStyles.getBasketPageWelcomeText2Style(
                    textScaleFactor),
              ),
              SizedBox(
                height: height * .07,
              ),
              Container(
                width: width / 1.2,
                height: height / 13,
                child: RaisedButton(
                  elevation: 0.0,
                  child: Text(
                    'В КАТАЛОГ ТОВАРОВ',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      fontSize: 16 / textScaleFactor,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(31),
                  ),
                  padding: const EdgeInsets.all(15),
                  color: Colors.pinkAccent,
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                        context,
                        new CupertinoPageRoute(
                            builder: (context) => new CatalogPage()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
