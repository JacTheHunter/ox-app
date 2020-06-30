import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fuckingnum/screens/feed/stories.dart';

class Stories_Element extends StatelessWidget {
  final String logo;

  Stories_Element(this.logo);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Stories(),
          ),
        );
      },
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 38,
        child: Container(
          width: width * .15,
          height: height * .08,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(68),
            image: DecorationImage(image: AssetImage(logo), fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
