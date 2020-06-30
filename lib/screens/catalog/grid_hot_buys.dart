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
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.fromLTRB(width * .01,0,0 ,0),
      child: Container(
        height: 280,
        child: GridView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: buys.length,
          itemBuilder: (context, i) => Hot_Item(
              buys[i].image, buys[i].discount, buys[i].oldprice, buys[i].price),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 0,
              childAspectRatio: 1),
        ),
      ),
    );
  }
}
