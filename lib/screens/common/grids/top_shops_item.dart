import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hexcolor/hexcolor.dart';

class Top_Shops_Item extends StatelessWidget {
  final String image;

  Top_Shops_Item(this.image);

  @override
  Widget build(BuildContext context) {
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;
    return Container(
      child: Card(
        elevation: 1,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover),
                  borderRadius: BorderRadius.all(Radius.circular(29.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Hexcolor("#979797").withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Celio*",
                      style: TextStyle(
                          color: Hexcolor("#0D3662"),
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Montserrat',
                          fontSize: 20.0 / textScaleFactor),
                    ),
                    RatingBar(
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
                    SizedBox(height: 1),
                    Container(
                      width: 120,
                      height: 33,
                      child: RaisedButton(
                        elevation: 0.0,
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(11.0))),
                        child: Text(
                          '+ Подписаться',
                          style: TextStyle(
                            fontSize: 11.0 / textScaleFactor,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                        textColor: Colors.white,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: IconButton(
                  alignment: Alignment.centerRight,
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Hexcolor("#0D3662"),
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
    );
  }
}
