import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fuckingnum/screens/branddetail_page/brand_detail_page.dart';

import '../../models/grid_brand_constructor.dart';
import 'brandslist.dart';

class Brands_Grid_Item extends StatelessWidget {
  final String image;

  Brands_Grid_Item(this.image);

  final List<Grid_Constructor> brands = [
    Grid_Constructor(image: 'icons/polo.png'),
    Grid_Constructor(image: 'icons/polo.png'),
    Grid_Constructor(image: 'icons/polo.png'),
    Grid_Constructor(image: 'icons/polo.png'),
    Grid_Constructor(image: 'icons/polo.png'),
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BrandDetailPage()),
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
          padding: EdgeInsets.fromLTRB(10, 3, 0, 0),
          child: Text(
            "Магазины",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 7,
              fontFamily: 'Montserrat',
              color: Colors.black,
            ),
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
