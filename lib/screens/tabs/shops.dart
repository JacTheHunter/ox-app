import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuckingnum/screens/tabs/shopsgrids/shop_grid.dart';
import 'package:fuckingnum/screens/tabs/shopsgrids/shop_grid_second.dart';
import 'package:fuckingnum/utils/ox-scrol-view.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../categories.dart';

class Shops extends StatefulWidget {
  @override
  _Shops createState() => _Shops();
}

class _Shops extends State<Shops> {
  void _settingModalBottomSheet(context) {
    var width = MediaQuery.of(context).size.width;
    int _selectedCat = 0;
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(29), topLeft: Radius.circular(29.0)),
      ),
      builder: (BuildContext bc) {
        return StatefulBuilder(
          builder: (BuildContext context, setState) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0, 18, 0, 18),
                child: Container(
                  width: 38,
                  height: 6,
                  decoration: BoxDecoration(
                      color: HexColor("#979797"),
                      borderRadius: BorderRadius.circular(4.5)),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2,
                  child: ListView.builder(
                    itemCount: categories.length,
                    itemBuilder: (ctx, i) {
                      return Container(
                        margin: EdgeInsets.fromLTRB(5, 5, 0, 0),
                        width: 295,
                        height: 45,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: _selectedCat == i
                              ? HexColor("#EBF1FD")
                              : Colors.white,
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _selectedCat = i;
                            });
                          },
                          child: Container(
                            width: width,
                            height: 45,
                            child: Center(
                              child: Text(
                                categories[i].title,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w400,
                                    color: HexColor("#0D3662")),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return OxScrollView(
        ScrollController(),
        Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 0, 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Мои магазины",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                      color: HexColor("#0D3662"),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Shop_Grid(),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: 34,
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: HexColor("#B7C1D2"),
                        ),
                        hintText: 'Поиск брендов',
                        hintStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: HexColor("#B7C1D2"),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    height: height * .06,
                    //width: MediaQuery.of(context).size.width / 2.9,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 12,
                          offset: Offset(0, 7),
                        ),
                      ],
                    ),
                    child: RaisedButton.icon(
                      elevation: 0,
                      onPressed: () {
                        _settingModalBottomSheet(context);
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                      label: Text(
                        'Популярные',
                        style: TextStyle(
                          color: HexColor("#0D3662"),
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Montserrat',
                          fontSize: 12,
                        ),
                      ),
                      icon: SvgPicture.asset('icons/sortingarrow.svg'),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Shop_Grid_Second(),
          ],
        ),
        GlobalKey());
  }
}
