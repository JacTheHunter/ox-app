import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class TabsProduct extends StatefulWidget {
  @override
  _TabsProduct createState() => _TabsProduct();
}

class _TabsProduct extends State<TabsProduct> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = new TabController(length: 2, vsync: this);

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Padding(
      padding: EdgeInsets.all(12),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(29.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 15,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(29.0),
          ),
          child: Container(
            width: width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(29.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(13),
                  child: TabBar(
                    labelColor: HexColor("#0D3662"),
                    unselectedLabelColor: HexColor("#B7C1D2"),
                    indicatorColor: HexColor("#0D3662"),
                    indicatorSize: TabBarIndicatorSize.label,
                    controller: tabController,
                    tabs: <Widget>[
                      Tab(
                        child: Text(
                          "Описание",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 16 / textScaleFactor,
                            fontWeight: FontWeight.w600,
                            //color: HexColor("#0D3662"),
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Характеристика",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 16 / textScaleFactor,
                            fontWeight: FontWeight.w600,
                            //color: HexColor("#0D3662"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  height: height * .45,
                  child: TabBarView(
                    controller: tabController,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(14),
                        child: Text(
                          "Вы слышали, что в этом сезоне неон - это буквально новый черный? А про броские дизайны, игры с прозрачными вставками и текстильными заплатками? Если нет, то вот вам пример - кроссовки PATROL. Можете не греть голову о ярком элементе в наряде - обувь сделает все за вас. А можете усилить образ, добавив детали в общий look - решать только вам. Но мы знаем точно, что такие кроссовки подходят не просто для спорта или прогулок по городу, но и для выхода прямо на подиум в самом необычном look'e. Крепкая шнуровка и нестандартная подошва, эргономичный дизайн, стиль и комфорт - достойный выбор для повседневной носки или же особого случая. Выходите на новый уровень вместе с PATROL!",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400,
                            fontSize: 14 / textScaleFactor,
                            color: HexColor("#627285"),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(14),
                        child: Text(
                          "Вы слышали, что в этом сезоне неон - это буквально новый черный? А про броские дизайны, игры с прозрачными вставками и текстильными заплатками? Если нет, то вот вам пример - кроссовки PATROL. Можете не греть голову о ярком элементе в наряде - обувь сделает все за вас. А можете усилить образ, добавив детали в общий look - решать только вам. Но мы знаем точно, что такие кроссовки подходят не просто для спорта или прогулок по городу, но и для выхода прямо на подиум в самом необычном look'e. Крепкая шнуровка и нестандартная подошва, эргономичный дизайн, стиль и комфорт - достойный выбор для повседневной носки или же особого случая. Выходите на новый уровень вместе с PATROL!",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 14 / textScaleFactor,
                            color: HexColor("#627285"),
                          ),
                        ),
                      ),
                    ],
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
