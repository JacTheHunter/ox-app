import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fuckingnum/screens/models/cart_constructor.dart';
import 'package:fuckingnum/screens/qrcode/qrcode.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class FABBottomAppBarItem {
  FABBottomAppBarItem({this.svgPic, this.text, this.value});

  final String value;
  String svgPic;
  String text;
}

class FABBottomAppBar extends StatefulWidget {
  FABBottomAppBar({
    this.items,
    this.centerItemText,
    this.height: 85.0,
    this.iconSize: 24.0,
    this.backgroundColor,
    this.color,
    this.notchedShape,
    this.onTabSelected,
  }) {
    assert(this.items.length == 2 || this.items.length == 4);
  }

  final List<FABBottomAppBarItem> items;
  final String centerItemText;
  final double height;
  final double iconSize;
  final Color backgroundColor;
  final Hexcolor color;
  final NotchedShape notchedShape;
  final ValueChanged<int> onTabSelected;

  @override
  State<StatefulWidget> createState() => FABBottomAppBarState();
}

class FABBottomAppBarState extends State<FABBottomAppBar> {
  int _selectedIndex = 0;

  _updateIndex(int index) {
    widget.onTabSelected(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
        item: widget.items[index],
        index: index,
        onPressed: _updateIndex,
      );
    });
    items.insert(items.length >> 1, _buildMiddleTabItem());

    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: width,
            height: height * .1,
            decoration: BoxDecoration(
                color: Hexcolor('946DDC'),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(31),
                  topLeft: Radius.circular(31),
                )),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: items,
            ),
          ),
        ),
        Container(
          width: width,
          height: height * .15,
          child: Center(
            child: Column(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(CupertinoPageRoute(
                      builder: (context) {
                        return Qr_Code();
                      },
                    ));
                  },
                  child: Material(
                      child: Container(
                        width: width * .17,
                        height: height * .09,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(23)),
                        child: Center(
                          child: SvgPicture.asset(
                            "icons/qrcode2.svg",
                            color: Hexcolor("#965EFF"),
                            height: width * .09,
                            width: width * .09,
                          ),
                        ),
                      ),
                      elevation: 2,
                      borderRadius: BorderRadius.circular(23)),
                ),
                Container(
                  height: height * .03,
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildMiddleTabItem() {
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: widget.iconSize),
            Text(
              widget.centerItemText ?? '',
              style: TextStyle(color: widget.color),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem({
    FABBottomAppBarItem item,
    int index,
    ValueChanged<int> onPressed,
  }) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;
    return Container(
      width: width * .2,
      height: height * .1,
      padding: EdgeInsets.only(top: height * .02),
      child: InkWell(
        onTap: () => onPressed(index),
        child: Container(
          height: height * .15,
          width: width * .2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: height * .045,
                width: width * .2,
                child: Stack(
                  children: <Widget>[
                    Align(
                      child: SvgPicture.asset(
                        item.svgPic,
                        height: height * .035,
                      ),
                    ),
                    index != 2
                        ? SizedBox.shrink()
                        : Align(
                            alignment: Alignment(.4, -1.2),
                            child: Container(
                              width: width * .04,
                              height: width * .04,
                              margin: EdgeInsets.only(bottom: width * .01),
                              decoration: BoxDecoration(
                                  color: Colors.pinkAccent,
                                  borderRadius:
                                      BorderRadius.circular(width * .014)),
                              child: Center(
                                child: Consumer<Cart>(
                                  builder: (context, value, child) {
                                    return Text(
                                      '${value.itemCount}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
              Text(
                item.text,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 10 / textScaleFactor,
                    fontFamily: 'Montserrat',
                    color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
