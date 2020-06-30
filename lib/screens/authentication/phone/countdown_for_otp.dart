import 'package:flutter/material.dart';

class Countdown extends AnimatedWidget {
  Countdown({Key key, this.animation}) : super(key: key, listenable: animation);
  final Animation<int> animation;

  @override
  build(BuildContext context) {
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    Duration clockTimer = Duration(seconds: animation.value);

    String timerText =
        '0${clockTimer.inMinutes.remainder(60).toString()} : ${(clockTimer.inSeconds.remainder(60) % 60).toString().padLeft(2, '0')}';

    return Text(
      "$timerText",
      style: TextStyle(
          fontSize: 14 / textScaleFactor,
          color: Colors.pink,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w500),
    );
  }
}
