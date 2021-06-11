import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuckingnum/screens/tabs/sortbrands_filter.dart';
import 'package:fuckingnum/utils/ox-scrol-view.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'brendgrids/brands_grid.dart';
import 'brendgrids/brands_grid_second.dart';

class Brands extends StatefulWidget {
  @override
  _Brands createState() => _Brands();
}

class _Brands extends State<Brands> {
  int _selectedCat = 0;

  void _settingModalBottomSheet(context) {
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
                      color: Hexcolor("#979797"),
                      borderRadius: BorderRadius.circular(4.5)),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2,
                  child: ListView.builder(
                    itemCount: brands_filter.length,
                    itemBuilder: (ctx, i) {
                      return GestureDetector(
                        onTap: () {
                          setState(
                                () {
                              _selectedCat = i;
                            },
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.fromLTRB(5, 5, 0, 0),
                          width: 295,
                          height: 45,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: _selectedCat == i
                                ? Hexcolor("#EBF1FD")
                                : Colors.white,
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Container(
                                width: 122,
                                height: 45,
                                child: Center(
                                  child: Text(
                                    brands_filter[i].title,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w400,
                                        color: Hexcolor("#0D3662")),
                                  ),
                                ),
                              ),
                            ],
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
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;
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
                    "Мои бренды",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 19 / textScaleFactor,
                      fontWeight: FontWeight.w600,
                      color: Hexcolor("#0D3662"),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: width * .02),
              child: Brands_Grid(),
            ),
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
                          color: Hexcolor("#B7C1D2"),
                        ),
                        hintText: 'Поиск брендов',
                        hintStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14 / textScaleFactor,
                          fontWeight: FontWeight.w400,
                          color: Hexcolor("#B7C1D2"),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    height: height * .06,
                    // width: MediaQuery.of(context).size.width / 2.9,
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
                          color: Hexcolor("#0D3662"),
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
            Brands_Grid_Second(),
          ],
        ),
        GlobalKey());
  }
}
