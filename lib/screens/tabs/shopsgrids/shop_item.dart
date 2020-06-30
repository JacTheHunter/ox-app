import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fuckingnum/screens/shopingpage/shopingdetailpage.dart';
import 'package:fuckingnum/screens/tabs/brendgrids/brandslist.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../models/grid_brand_constructor.dart';

class Shop_Item1 extends StatelessWidget {
  final String image;

  final List<Grid_Constructor> brands = [
    Grid_Constructor(image: 'icons/polo.png'),
    Grid_Constructor(image: 'icons/polo.png'),
    Grid_Constructor(image: 'icons/polo.png'),
    Grid_Constructor(image: 'icons/polo.png'),
  ];

  Shop_Item1(this.image);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ShopingDetailPage()),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: 106,
              height: 106,
              color: Colors.white,
              child: GridTile(
                child: Image.asset(image, fit: BoxFit.cover),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(7, 3, 0, 0),
          child: RatingBar(
            itemSize: 16.5,
            initialRating: 0,
            minRating: 0,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 1),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Hexcolor("##FECE2F"),
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
        ),
        Container(
          height: 30,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: brands.length,
            itemBuilder: (context, index) {
              return brandList(brands[index].image);
            },
          ),
        ),
      ],
    );
  }
}
