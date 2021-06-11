import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../models/hot_buys_constructor.dart';
import 'hot_item.dart';

class Grid_Hot_Buys extends StatelessWidget {
  final List<Hot_Buys_Constructor> buys = [
    Hot_Buys_Constructor(
      image: 'images/banner1.jpg',
      oldprice: '10 000 000 UZS',
      price: '200 000 UZS',
      discount: "-50%",
    ),
    Hot_Buys_Constructor(
      image: 'images/banner1.jpg',
      oldprice: '10 000 000 UZS',
      price: '500 000 UZS',
      discount: "-10%",
    ),
    Hot_Buys_Constructor(
      image: 'images/banner1.jpg',
      oldprice: '100 000UZS',
      price: '20 000 UZS',
      discount: "-30%",
    ),
    Hot_Buys_Constructor(
      image: 'images/banner1.jpg',
      oldprice: '500 000 UZS',
      price: '10 000 UZS',
      discount: "-40%",
    ),
    Hot_Buys_Constructor(
      image: 'images/banner1.jpg',
      oldprice: '50 000 UZS',
      price: '40 000 UZS',
      discount: "-50%",
    ),
    Hot_Buys_Constructor(
      image: 'images/banner1.jpg',
      oldprice: '100 000 UZS',
      price: '30 000 UZS',
      discount: "-70%",
    ),
    Hot_Buys_Constructor(
      image: 'images/banner1.jpg',
      oldprice: '100 000 UZS',
      price: '30 000 UZS',
      discount: "-70%",
    ),
    Hot_Buys_Constructor(
      image: 'images/banner1.jpg',
      oldprice: '100 000 UZS',
      price: '30 000 UZS',
      discount: "-70%",
    ),
    Hot_Buys_Constructor(
      image: 'images/banner1.jpg',
      oldprice: '100 000 UZS',
      price: '30 000 UZS',
      discount: "-70%",
    ),
    Hot_Buys_Constructor(
      image: 'images/banner1.jpg',
      oldprice: '100 000 UZS',
      price: '30 000 UZS',
      discount: "-70%",
    ),
    Hot_Buys_Constructor(
      image: 'images/banner1.jpg',
      oldprice: '100 000 UZS',
      price: '30 000 UZS',
      discount: "-70%",
    ),
    Hot_Buys_Constructor(
      image: 'images/banner1.jpg',
      oldprice: '100 000 UZS',
      price: '30 000 UZS',
      discount: "-70%",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    List<Widget> _hotItemColumns = [];

    for (int i = 0; i < this.buys.length; i += 2) {
      List<Widget> _hotItemsColumn = [];
      if (i < buys.length) {
        _hotItemsColumn.add(Hot_Item(
            buys[i].image, buys[i].discount, buys[i].price, buys[i].oldprice));
      }
      if (i + 1 < buys.length) {
        _hotItemsColumn.add(Hot_Item(buys[i + 1].image, buys[i + 1].discount,
            buys[i + 1].price, buys[i + 1].oldprice));
      }
      _hotItemColumns.add(
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _hotItemsColumn,
        ),
      );
    }

    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _hotItemColumns,
        ),
      ),
    );
  }
}
