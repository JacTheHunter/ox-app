import 'package:flutter/material.dart';
import 'package:fuckingnum/screens/feed/stories_element.dart';
import 'list_stories_constructor.dart';

class list_view_for_stories extends StatelessWidget {
  final List<List_Stories_Constructor> stories = [
    List_Stories_Constructor(logo: "images/story1.png"),
    List_Stories_Constructor(logo: "images/story2.png"),
    List_Stories_Constructor(logo: "images/story3.png"),
    List_Stories_Constructor(logo: "images/story4.png"),
    List_Stories_Constructor(logo: "images/story5.png"),
    List_Stories_Constructor(logo: "images/story4.png"),
    List_Stories_Constructor(logo: "images/story5.png"),
    List_Stories_Constructor(logo: "images/story4.png"),
    List_Stories_Constructor(logo: "images/story5.png"),
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(width * .025, height * .05, 0, 0),
        child: Container(
          height: height / 4.2,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: stories.length,
            itemBuilder: (context, index) {
              return Stories_Element(stories[index].logo, true);
            },
          ),
        ),
      ),
    );
  }
}
