import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuckingnum/categories3.dart';
import 'package:fuckingnum/providers/my_buys_provider.dart';
import 'package:fuckingnum/utils/bottom-navigation-bar-utils.dart';
import 'package:fuckingnum/utils/ox-scrol-view.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'mybuys_el.dart';

class MyBuys extends StatefulWidget {
  static const routeName = '/mybuys';

  @override
  _MyBuys createState() => _MyBuys();
}

class _MyBuys extends State<MyBuys> {
  int _selectedCat = 0;

  @override
  Widget build(BuildContext context) {
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;
    var height = MediaQuery.of(context).size.height;

    final productsData = Provider.of<MyBuys_Provider>(context);
    final list = productsData.items;

    var scaffoldWithBottomNavigation = ScaffoldWithBottomNavigation();
    scaffoldWithBottomNavigation.appBar = AppBar(
      elevation: 0,
      backgroundColor: HexColor("#F7F8FB"),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: HexColor("#0D3662"),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
    scaffoldWithBottomNavigation.body = Padding(
        padding: const EdgeInsets.all(15),
        child: OxScrollView(
            ScrollController(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(5, 0, 0, 20),
                  child: Text(
                    "Мои покупки",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w600,
                      fontSize: 28,
                      color: HexColor("#0D3662"),
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  child: StatefulBuilder(
                    builder: (BuildContext ctx, StateSetter setState) =>
                        ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categories3.length,
                          itemBuilder: (ctx, i) {
                            return Padding(
                              padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(9),
                                onTap: () {
                                  setState(() {
                                    _selectedCat = i;
                                  });
                                },
                                child: Container(
                                  height: 37,
                                  decoration: BoxDecoration(
                                    color: _selectedCat == i
                                        ? HexColor("#965EFF")
                                        : HexColor("#EBF1FD"),
                                    borderRadius: BorderRadius.circular(9.0),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 20),
                                      child: Text(
                                        "${categories3[i].title}",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 14 / textScaleFactor,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w400,
                                          color: _selectedCat == i
                                              ? Colors.white
                                              : HexColor("#627285"),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                  ),
                ),
                Container(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: list.length,
                    itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                      value: list[i],
                      child: myBuys_el(),
                    ),
                  ),
                ),
              ],
            ),
            GlobalKey()));
    return scaffoldWithBottomNavigation;
  }
}
