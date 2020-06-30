import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ProductCard extends StatelessWidget {
  final int value;

  const ProductCard({Key key, this.value = 5})
      : assert(value != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Container(
        height: 110,
        width: MediaQuery.of(context).size.width,
        child: Card(
          elevation: 1,
          child: Padding(
            padding: EdgeInsets.all(8.7),
            child: Row(
              children: <Widget>[
                Container(
                  width: 80,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                          image: AssetImage("icons/colins.png"),
                          fit: BoxFit.contain),
                      borderRadius: BorderRadius.all(Radius.circular(29.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Hexcolor("#979797").withOpacity(0.1),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        )
                      ]),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Бренд",
                        style: TextStyle(
                          fontSize: 15.3,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Montserrat',
                          color: Hexcolor("#0D3662"),
                        ),
                      ),
                      SizedBox(height: 8.4),
                      Text(
                        "Colin's",
                        style: TextStyle(
                            color: Hexcolor("#0D3662"),
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Montserrat',
                            fontSize: 19.0),
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
      ),
    );
  }
}
