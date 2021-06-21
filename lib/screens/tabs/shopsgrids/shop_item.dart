import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fuckingnum/screens/models/grid_brand_constructor.dart';
import 'package:fuckingnum/screens/shopingpage/shoppingdetailpage.dart';
import 'package:hexcolor/hexcolor.dart';

class Shop_Item1 extends StatefulWidget {
  final String image;

  Shop_Item1(this.image);

  @override
  _Shop_Item1State createState() => _Shop_Item1State();
}

class _Shop_Item1State extends State<Shop_Item1> {
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

  List<Widget> _brandsRow;

  void _showAllBrands() {
    _brandsRow = [];
    for (var value in this.brands) {
      _brandsRow.add(_BrandBottomItem(value.image));
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _brandsRow = [];

    Future.delayed(Duration.zero, () {
      var width = MediaQuery.of(context).size.width;

      setState(() {
        _brandsRow = [
          brands.length > 0
              ? _BrandBottomItem(brands[0].image)
              : Container(
                  width: width * .06,
                ),
          brands.length > 1
              ? _BrandBottomItem(brands[1].image)
              : Container(
                  width: width * .06,
                ),
          brands.length > 2
              ? _BrandBottomItem(brands[2].image)
              : Container(
                  width: width * .06,
                ),
          brands.length > 3
              ? InkWell(
                  onTap: brands.length - 4 > 0 ? this._showAllBrands : null,
                  child: _BrandBottomItem(
                    brands[3].image,
                    increasedCount: brands.length - 4,
                  ),
                )
              : Container(
                  width: width * .06,
                ),
        ];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;
    return Container(
      width: width * .3,
      margin: EdgeInsets.only(left: width * .02, bottom: height * .015),
      child: Column(
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
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => ShoppingDetailPage()),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  color: Colors.white,
                  child: GridTile(
                    child: Image.asset(widget.image, fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: width * .3,
            padding: EdgeInsets.only(top: height * .005),
            child: Center(
              child: RatingBar.builder(
                itemSize: width * .05,
                initialRating: 0,
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 1),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: HexColor("##FECE2F"),
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ),
          ),
          Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: this._brandsRow,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BrandBottomItem extends StatelessWidget {
  final String _brandImage;
  int increasedCount;

  _BrandBottomItem(this._brandImage, {this.increasedCount});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: width * .01),
          child: Container(
            width: width * .06,
            height: width * .06,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(width * .06),
              image: DecorationImage(
                image: AssetImage(this._brandImage),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        this.increasedCount != null && this.increasedCount > 0
            ? Container(
                width: width * .06,
                height: width * .06,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width * .06),
                  color: Colors.black.withOpacity(0.4),
                ),
                child: Center(
                  child: Text(
                    '+$increasedCount',
                    textScaleFactor: 1,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                    ),
                  ),
                ),
              )
            : SizedBox.shrink()
      ],
    );
  }
}
