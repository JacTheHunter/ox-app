import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Tabs_For_Shops extends StatefulWidget {
  @override
  _TabsProdState createState() => _TabsProdState();
}

class _TabsProdState extends State<Tabs_For_Shops> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    TabController tabController = new TabController(length: 2, vsync: this);
    return Padding(
      padding: EdgeInsets.all(12),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(29.0),
        ),
        child: Container(
          width: width,
          height: height/1.85,
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
                      "Где находится?",
                      textScaleFactor: 1.0,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 16 ,
                        fontWeight: FontWeight.w600,
                        color: Hexcolor("#0D3662"),
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "О магазине",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Hexcolor("#0D3662"),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                height: height/2.1,
                child: TabBarView(
                  controller: tabController,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(14),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "г.Ташкент , Мирабадский \nрайон , ул.Нукус д.89",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w400,
                                        color: Hexcolor("#627285"),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "Ориентир: Kapital bank",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Montserrat',
                                        fontSize: 12,
                                        color: Hexcolor("#627285"),
                                      ),
                                    ),
                                    Text(
                                      "Тел.: 78 798 89 89",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Montserrat',
                                        fontSize: 12,
                                        color: Hexcolor("#627285"),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  width: width / 3.9,
                                  height: height / 7.5,
                                  decoration: BoxDecoration(
                                    color: Hexcolor('#979797'),
                                    image: DecorationImage(
                                        image: AssetImage("icons/polo1.jpg"),
                                        fit: BoxFit.cover),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(22.0)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 0,
                            width: MediaQuery.of(context).size.width,
                            child:
                            Divider(height: 0, color: Hexcolor('#979797')),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "г.Ташкент , Мирабадский \nрайон , ул.Нукус д.89",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w400,
                                        color: Hexcolor("#627285"),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "Ориентир: Kapital bank",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Montserrat',
                                        fontSize: 12,
                                        color: Hexcolor("#627285"),
                                      ),
                                    ),
                                    Text(
                                      "Тел.: 78 798 89 89",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Montserrat',
                                        fontSize: 12,
                                        color: Hexcolor("#627285"),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  width: width / 3.9,
                                  height: height / 7.5,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    image: DecorationImage(
                                        image: AssetImage("icons/polo1.jpg"),
                                        fit: BoxFit.cover),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(22.0)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(14),
                      child: Text(
                        '''Вы слышали, что в этом сезоне неон - это буквально новый черный? А про броские дизайны, игры с прозрачными вставками и текстильными заплатками? Если нет, то вот вам пример - кроссовки PATROL. Можете не греть голову о ярком элементе в наряде - обувь сделает все за вас. А можете усилить образ, добавив детали в общий look - решать только вам. Но мы знаем точно, что такие кроссовки подходят не просто для спорта или прогулок по городу, но и для выхода прямо на подиум в самом необычном look'e. Крепкая шнуровка и нестандартная подошва, эргономичный дизайн, стиль и комфорт - достойный выбор для повседневной носки или же особого случая. Выходите на новый уровень вместе с PATROL!''',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400,
                          fontSize: 13 ,
                          color: Hexcolor("#627285"),
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
    );
  }
}
