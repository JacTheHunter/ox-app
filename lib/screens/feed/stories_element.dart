import 'package:dashed_circle/dashed_circle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fuckingnum/screens/feed/stories.dart';
import 'package:hexcolor/hexcolor.dart';

class Stories_Element extends StatefulWidget {
  bool isSeen;
  final String logo;

  Stories_Element(this.logo , this.isSeen);

  @override
  _Stories_Element createState() => _Stories_Element();
}

class _Stories_Element extends State<Stories_Element> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(
          left: width * .001,
          right: width * .03,
          bottom: height * .025,
          top: height * .01),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => Stories(),
            ),
          );
        },
        child: this.widget.isSeen ? DashedCircle(
          strokeWidth: 1,
          color: Hexcolor("#965EFF"),
          child: Padding(
            padding: EdgeInsets.all(3),
            child: ClipOval(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                ),
                height: height * .04, // height of the button
                width: width * .15, // width of the button
                child: Center(
                  child: Image.asset(
                    widget.logo,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ): ClipOval(
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
            ),
            height: height * .04, // height of the button
            width: width * .15, // width of the button
            child: Center(
              child: Image.asset(
                widget.logo,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
