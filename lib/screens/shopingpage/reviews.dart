import 'package:flutter/material.dart';
import 'package:fuckingnum/providers/reviewsProvider.dart';
import 'package:fuckingnum/screens/product_detail_page/reviewItem.dart';
import 'package:provider/provider.dart';

class Reviews extends StatefulWidget {
  static const routeName = '/reviews';

  @override
  _Reviews createState() => _Reviews();
}

class _Reviews extends State<Reviews> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;
    final productsData = Provider.of<ReviewsProvider>(context);
    final list = productsData.items;

    return Column(
      children: [
        Container(
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: list.length,
            itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
              value: list[i],
              child: ReviewItem(),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(width * .03, 0, 0, 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  setState(() {});
                },
                child: new Stack(
                  children: <Widget>[
                    Text(
                      "Показать еще",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        fontSize: 15.0 / textScaleFactor,
                        color: Color(0xFF000080),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, height * .015, 0, 0),
                      child: Container(
                        width: width * .25,
                        height: height * .01,
                        color: Color(0xFF965EFF).withOpacity(0.2),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
