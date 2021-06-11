import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fuckingnum/screens/branddetail_page/brand_detail_page.dart';
import 'package:fuckingnum/screens/models/grid_brand_constructor.dart';
import 'package:provider/provider.dart';
import 'brandslist.dart';

class Brands_Grid_Item extends StatefulWidget {
  @override
  _Brands_Grid_Item createState() => _Brands_Grid_Item();
}

class _Brands_Grid_Item extends State<Brands_Grid_Item>
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
    final product = Provider.of<GridConstructor>(context, listen: false);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
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
              Navigator.of(context).pushNamed(BrandDetailPage.routeName , arguments: product.id);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                // width: 106,
                // height: 106,
                color: Colors.white,
                child: GridTile(
                  child: Image.asset(product.image, fit: BoxFit.cover),
                ),
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
