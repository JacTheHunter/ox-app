import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuckingnum/screens/models/grid_card_constructor.dart';
import 'package:fuckingnum/screens/product_detail_page/promotionlist_item.dart';

class Promotions_List extends StatefulWidget {
  @override
  _Promotions_List createState() => _Promotions_List();
}

class _Promotions_List extends State<Promotions_List> {
  final List<Grid_Card_Constructor> list = [
    Grid_Card_Constructor(
        title: '1+1=3 \nКупи два третий \nв подарок', image: 'icons/present.svg'),
    Grid_Card_Constructor(
        title: '1+1=3 \nКупи два третий \nв подарок', image: 'icons/money.svg'),
    Grid_Card_Constructor(
        title: '1+1=3 \nКупи два третий \nв подарок', image: 'icons/credit.svg'),
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          Container(
            height: height / 8,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              itemBuilder: (context, index) =>
                  PromList_Item(list[index].title ,list[index].image),
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}
