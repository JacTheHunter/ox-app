import 'package:flutter/material.dart';
import 'package:fuckingnum/screens/catalog/forgirls/girls_clothes.dart';
import 'package:fuckingnum/transitions/rightslide.dart';
import 'package:hexcolor/hexcolor.dart';

class SubSubItem extends StatelessWidget {
  int _selectedCat = 0;

  final String image;
  final String title;

  SubSubItem(this.image, this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 19, 8),
      child: FlatButton(
        onPressed: () {
          Navigator.push(
            context,
            SlideRightRoute(page: Girls_Clothes()),
          );
        },
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(8, 7, 10, 7),
                child: Container(
                  width: 36,
                  height: 36,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.asset(image, fit: BoxFit.cover),
                  ),
                ),
              ),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Montserrat',
                  fontSize: 13,
                  color: Hexcolor("#0D3662"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
