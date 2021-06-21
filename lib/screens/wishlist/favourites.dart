import 'package:flutter/material.dart';
import 'package:fuckingnum/providers/products_provider.dart';
import 'package:fuckingnum/screens/catalog/forgirls/grid_girls_item.dart';
import 'package:fuckingnum/screens/product_detail_page/product_detail_page.dart';
import 'package:fuckingnum/transitions/rightslide.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class Favourites extends StatefulWidget {
  @override
  _Favourites createState() => _Favourites();
}

class _Favourites extends State<Favourites> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    final productsData = Provider.of<Products>(context);
    final grid =
        productsData.items.where((element) => element.isFavourite).toList();

    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor("#F7F8FB"),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: HexColor("#F7F8FB"),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: HexColor("#0D3662"),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          centerTitle: true,
          title: Text(
            'Избранные',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 20 / textScaleFactor,
              fontWeight: FontWeight.w600,
              color: Color(0xFF0D3662),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: grid.isEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: height / 1.7,
                      width: width / 1.5,
                      //margin: EdgeInsets.only(left: width / 10000),
                      child: Image.asset(
                        'images/wishlist.png',
                        fit: BoxFit.contain,
                        alignment: Alignment.center,
                      ),
                    ),
                    SizedBox(height: height / 30),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        'У вас нету \n избранных товаров',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 24 / textScaleFactor,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF0D3662),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                )
              : Padding(
                  padding: EdgeInsets.fromLTRB(width * .03, 0, width * .03, 0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: grid.length,
                    itemBuilder: (context, i) => ChangeNotifierProvider.value(
                      value: grid[i],
                      child: GestureDetector(
                        child: Grid_Girls_Item(
                          isFavorite: true,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            new SlideRightRoute(widget: ProductPage()),
                          );
                        },
                      ),
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.57,
                      mainAxisSpacing: 30,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
