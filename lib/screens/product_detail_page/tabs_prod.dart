import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class TabsProduct extends StatefulWidget {
  @override
  _TabsProduct  createState() => _TabsProduct();
}

class _TabsProduct extends State<TabsProduct> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = new TabController(length: 2, vsync: this);
    return Padding(
      padding: EdgeInsets.all(12),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(29.0),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 442,
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
              TabBar(
                indicatorColor: Hexcolor("#0D3662"),
                indicatorSize: TabBarIndicatorSize.label,
                controller: tabController,
                tabs: <Widget>[
                  Tab(
                    child: Text(
                      "Описание",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Hexcolor("#0D3662"),
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Характеристика",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Hexcolor("#0D3662"),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                height: 390,
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
                          fontSize: 13,
                          color: Hexcolor("#627285"),
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.all(14),
                        child: Text(
                          '''Вы слышали, что в этом сезоне неон - это буквально новый черный? А про броские дизайны, игры с прозрачными вставками и текстильными заплатками? Если нет, то вот вам пример - кроссовки PATROL. Можете не греть голову о ярком элементе в наряде - обувь сделает все за вас. А можете усилить образ, добавив детали в общий look - решать только вам. Но мы знаем точно, что такие кроссовки подходят не просто для спорта или прогулок по городу, но и для выхода прямо на подиум в самом необычном look'e. Крепкая шнуровка и нестандартная подошва, эргономичный дизайн, стиль и комфорт - достойный выбор для повседневной носки или же особого случая. Выходите на новый уровень вместе с PATROL!''',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: Hexcolor("#627285"),
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
