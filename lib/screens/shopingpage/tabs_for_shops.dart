import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fuckingnum/screens/shopingpage/tab_bar_child.dart';
import 'package:hexcolor/hexcolor.dart';
import 'tab_bar_properties.dart';

class Tabs_For_Shops extends StatefulWidget {
  @override
  _TabsProdState createState() => _TabsProdState();
}

class _TabsProdState extends State<Tabs_For_Shops>
    with TickerProviderStateMixin {
  int perPage = 2;
  int present = 0;
  List<TabBarProperty> items = List<TabBarProperty>();

  @override
  void initState() {
    super.initState();
    setState(() {
      items.addAll(properties.getRange(present, present + perPage));
      present = present + perPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;
    TabController tabController = new TabController(length: 2, vsync: this);

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
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TabBar(
                    labelColor: HexColor("#0D3662"),
                    unselectedLabelColor: HexColor("#B7C1D2"),
                    indicatorColor: HexColor("#0D3662"),
                    indicatorSize: TabBarIndicatorSize.label,
                    controller: tabController,
                    tabs: <Widget>[
                      Tab(
                        child: FittedBox(
                          child: Text(
                            "Где находится?",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: HexColor("#0D3662"),
                            ),
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
                            color: HexColor("#0D3662"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                  EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                  height: height / 2.1,
                  child: TabBarView(
                    controller: tabController,
                    children: <Widget>[
                      Container(
                        child: ListView.builder(
                          itemCount: (present <= items.length)
                              ? items.length + 1
                              : items.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return (index == items.length)
                                ? Container(
                              child: FlatButton(
                                onPressed: () {
                                  setState(() {
                                    if ((present + perPage) >
                                        properties.length) {
                                      items.addAll(properties.getRange(
                                          present, properties.length));
                                    } else {
                                      items.addAll(properties.getRange(
                                          present, present + perPage));
                                    }
                                    present = present + perPage;
                                  });
                                },
                                child: Text(
                                  'Показать еще ${properties.length - items.length} магазинов',
                                  style: TextStyle(
                                    fontSize: 13 / textScaleFactor,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF0D3662),
                                  ),
                                ),
                              ),
                            )
                                : TabBarChild(index);
                          },
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
