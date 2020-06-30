import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

class Stories extends StatefulWidget {
  @override
  _Stories createState() => _Stories();
}

class _Stories extends State<Stories> {
  final storyController = StoryController(); // used t


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoryView(
        onVerticalSwipeComplete: (direction) {
          if (direction == Direction.down) {
            // ignore: unnecessary_statements
            Navigator.of(context).pop();
          }
        },
        storyItems: [
          StoryItem.text(
            title: "I guess you'd love to see screens.more of our food. That's great.",
            backgroundColor: Colors.blue,
          ),
          StoryItem.text(
            title: "Nice!\n\nTap to continue.",
            backgroundColor: Colors.red,
            textStyle: TextStyle(
              fontFamily: 'Dancing',
              fontSize: 40,
            ),
          ),
          StoryItem.pageImage(
            url:
                "https://image.ibb.co/cU4WGx/Omotuo-Groundnut-Soup-braperucci-com-1.jpg",
            caption: "Still sampling",
            controller: storyController,
          ),
          StoryItem.pageImage(
              url: "https://media.giphy.com/media/5GoVLqeAOo6PK/giphy.gif",
              caption: "Working with gifs",
              controller: storyController),
          StoryItem.pageImage(
            url: "https://media.giphy.com/media/XcA8krYsrEAYXKf4UQ/giphy.gif",
            caption: "Hello, from the other side",
            controller: storyController,
          ),
          StoryItem.pageImage(
            url: "https://media.giphy.com/media/XcA8krYsrEAYXKf4UQ/giphy.gif",
            caption: "Hello, from the other side2",
            controller: storyController,
          ),
        ],
        onStoryShow: (s) {
          print("Showing a story");
        },
        onComplete: () {
          Navigator.of(context).pop();
        },
        progressPosition: ProgressPosition.top,
        repeat: false,
        controller: storyController,
      ),
    );
  }
}
