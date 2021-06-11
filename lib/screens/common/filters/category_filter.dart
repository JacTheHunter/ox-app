import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuckingnum/screens/more/chekc_item.dart';
import 'package:hexcolor/hexcolor.dart';

class CategoryFilter extends StatefulWidget {
  @override
  _CategoryFilterState createState() => _CategoryFilterState();
}

class _CategoryFilterState extends State<CategoryFilter> {
  List<CheckItem> checkItem = [
    CheckItem(item: 'Accessories', quantity: 1343),
    CheckItem(item: 'Dresses', quantity: 1242500),
    CheckItem(item: 'Face + Body', quantity: 284),
    CheckItem(item: 'FootWear', quantity: 4568),
    CheckItem(item: 'Jeans & Trousers', quantity: 4568),
    CheckItem(item: 'Jewelerry', quantity: 563),
    CheckItem(item: 'Knitwear & Sweatsssss', quantity: 346),
    CheckItem(item: 'Living + Gifts', quantity: 234),
    CheckItem(item: 'Iqos', quantity: 100),
    CheckItem(item: 'Iqos', quantity: 100),
    CheckItem(item: 'Iqos', quantity: 100),
    CheckItem(item: 'Iqos', quantity: 1000),
  ];
  final List<CheckItem> items = [];
  int perPage = 8;
  int present = 0;
  bool isOpened = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      items.addAll(checkItem.getRange(present, present + perPage));
      present = present + perPage;
    });
  }

  static Icon add = Icon(Icons.add, color: Color(0xFF0D3662));
  Icon remove = Icon(Icons.remove, color: Color(0xFF0D3662));
  var icon = add;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;
    return ExpansionTile(
      initiallyExpanded: isOpened,
      trailing: icon == add
          ? SizedBox()
          : Container(
              child: FlatButton(
                onPressed: () {},
                child: Text(
                  'Очистить',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Montserrat',
                      fontSize: 16 / textScaleFactor,
                      color: Hexcolor("#965EFF")),
                ),
              ),
            ),
      leading: Padding(padding: EdgeInsets.only(left: 6.1), child: icon),
      onExpansionChanged: (val) {
        setState(() {
          icon = icon == remove ? add : remove;
        });
      },
      title: Text(
        'Категория',
        style: TextStyle(
            fontWeight: FontWeight.w400,
            fontFamily: 'Montserrat',
            fontSize: 16 / textScaleFactor,
            color: Hexcolor("#0D3662")),
      ),
      children: <Widget>[
        ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount:
                (present <= checkItem.length) ? items.length + 1 : items.length,
            itemBuilder: (context, index) {
              return (index == items.length)
                  ? Container(
                      margin: EdgeInsets.only(top: height / 30),
                      padding: EdgeInsets.fromLTRB(
                          width * .02, 0, width * .02, height * .01),
                      height: height * .09,
                      width: width,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(14.0))),
                        onPressed: () {
                          setState(() {
                            if ((present + perPage) > checkItem.length) {
                              items.addAll(checkItem.getRange(
                                  present, checkItem.length));
                            } else {
                              items.addAll(checkItem.getRange(
                                  present, present + perPage));
                            }
                            present = present + perPage;
                          });
                        },
                        textColor: Colors.white,
                        color: Hexcolor("#0E3763"),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            "Показать все категории",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0 / textScaleFactor,
                            ),
                          ),
                        ),
                      ),
                    )
                  : CheckItem(
                      item: items[index].item, quantity: items[index].quantity);
            }),
        SizedBox(height: height * .02),
      ],
    );
  }
}
