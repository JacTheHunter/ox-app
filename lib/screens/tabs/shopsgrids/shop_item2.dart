import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fuckingnum/screens/models/ShopConstructor.dart';
import 'package:fuckingnum/screens/models/grid_brand_constructor.dart';
import 'package:fuckingnum/screens/shopingpage/shoppingdetailpage.dart';
import 'package:fuckingnum/screens/tabs/brendgrids/brandslist.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class Shop_Item2 extends StatefulWidget {
  @override
  _Shop_Item1State createState() => _Shop_Item1State();
}

class _Shop_Item1State extends State<Shop_Item2>
    with SingleTickerProviderStateMixin {
  int present = 0;
  int perPage = 3;
  var items = List<GridConstructor>();

  final List<GridConstructor> brands = [
    GridConstructor(image: 'icons/polo.png'),
    GridConstructor(image: 'icons/okaidi.png'),
    GridConstructor(image: 'icons/morgan.png'),
    GridConstructor(image: 'icons/chicco.png'),
    GridConstructor(image: 'icons/iam.png'),
    GridConstructor(image: 'icons/bata.png'),
    GridConstructor(image: 'icons/polo.png'),
    GridConstructor(image: 'icons/polo.png'),
  ];

  @override
  void initState() {
    super.initState();

    setState(() {
      items.addAll(brands.getRange(present, present + perPage));
      present = present + perPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    var textScaleFactor = MediaQuery.of(context).textScaleFactor;
    final product = Provider.of<ShopConstructor>(context, listen: false);

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 12,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(ShoppingDetailPage.routeName,
                  arguments: product.id);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: EdgeInsets.all(12),
                color: Colors.white,
                child: GridTile(
                  child: Image.asset(product.image, fit: BoxFit.cover),
                ),
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
            itemCount:
                (present <= brands.length) ? items.length + 1 : items.length,
            itemBuilder: (context, index) {
              return (index == items.length)
                  ? Padding(
                      padding: EdgeInsets.only(top: height * .0028),
                      child: GestureDetector(
                        child: Stack(
                          overflow: Overflow.visible,
                          children: <Widget>[
                            Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(product.image),
                                      fit: BoxFit.scaleDown),
                                  shape: BoxShape.circle),
                            ),
                            Container(
                              height: 25,
                              width: 25,
                              child: Text(
                                'd',
                                style: TextStyle(color: Colors.transparent),
                              ),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black.withOpacity(0.3),
                              ),
                            ),
                            Positioned(
                              left: width / 70,
                              top: height / 130,
                              child: Text(
                                '+${brands.length - items.length}',
                                style: TextStyle(
                                    fontSize: 10 / textScaleFactor,
                                    fontFamily: 'Montserrat',
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          setState(() {
                            if ((present + perPage) > brands.length) {
                              items.addAll(
                                  brands.getRange(present, brands.length));
                            } else {
                              items.addAll(
                                  brands.getRange(present, present + perPage));
                            }
                            present = present + perPage;
                          });
                        },
                      ),
                    )
                  : brandList(brands[index].image);
            },
          ),
        ),
      ],
    );
  }
}
