import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuckingnum/providers/product_page-provider.dart';
import 'package:fuckingnum/providers/products_provider.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class Variation extends StatefulWidget {
  String productId;

  Variation({this.productId});

  @override
  _Variation createState() => _Variation();
}

class _Variation extends State<Variation> {
  int _selectedSizeIndex = 0;
  int _selectedColorIndex = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    var sizes = Provider.of<Products>(context).findById(widget.productId).sizes;
    var colors =
        Provider.of<Products>(context).findById(widget.productId).colors;

    return Padding(
      padding: EdgeInsets.fromLTRB(18, 19, 15, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(17),
            width: 342,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(29.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Размер",
                  style: TextStyle(
                      color: HexColor("#0D3662"),
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                      fontSize: 15.0),
                ),
                SizedBox(height: 8),
                Container(
                  height: height * .098,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: sizes.length,
                    itemBuilder: (ctx, i) {
                      return InkWell(
                        onTap: () {
                          Provider.of<ProductPageProvider>(context,
                                  listen: false)
                              .selectProductSize(
                                  widget.productId, sizes[_selectedSizeIndex]);
                          setState(() {
                            _selectedSizeIndex = i;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.fromLTRB(
                              width * .01, 0, width * .03, 0),
                          width: width * .12,
                          height: height * .03,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: HexColor("#EBF1FD"),
                            border: Border.all(
                              width: 2.5,
                              color: _selectedSizeIndex == i
                                  ? HexColor("#965EFF")
                                  : Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Container(
                            width: width * .12,
                            height: height * .03,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(
                                  "${sizes[i]}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16 / textScaleFactor,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w500,
                                      color: _selectedSizeIndex == i
                                          ? HexColor("#0D3662")
                                          : HexColor("#6683A5")),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 19),
                Text(
                  "Цвет",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Montserrat',
                      color: HexColor("#0D3662")),
                ),
                SizedBox(height: 5),
                Container(
                  height: height * .09,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: colors.length,
                    itemBuilder: (ctx, index) {
                      return InkWell(
                        onTap: () {
                          Provider.of<ProductPageProvider>(context,
                                  listen: false)
                              .selectProductColor(widget.productId,
                                  colors[_selectedColorIndex]);
                          setState(() {
                            _selectedColorIndex = index;
                          });
                        },
                        child: Container(
                          width: width * .14,
                          height: height * .001,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                width: 3,
                                color: _selectedColorIndex == index
                                    ? HexColor("#965EFF")
                                    : Colors.white),
                          ),
                          child: Container(
                            width: width * .12,
                            height: height * .07,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: HexColor(colors[index]),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
