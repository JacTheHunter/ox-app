import 'package:flutter/material.dart';
import '../../models/for_girls_constructor.dart';
import 'package:fuckingnum/screens/catalog/forgirls/list_girls_element.dart';

class List_View_Girls extends StatelessWidget {

  final List<For_Girls_Constructor> girls = [
    For_Girls_Constructor(title: "Платья", image: "images/platya.jpg"),
    For_Girls_Constructor(title: "Водолазки и логсливы", image: "images/vododlazki.jpg"),
    For_Girls_Constructor(title: "Брюки и \nджинсы", image: "images/vododlazki.jpg"),
  ];

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.fromLTRB(width * .045, 0, 0, 0),
      child: Container(
        height: height / 4.2,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: girls.length,
          itemBuilder: (context, index) {
            return List_Girls_Element(girls[index].image, girls[index].title);
          },
        ),
      ),
    );
  }
}
