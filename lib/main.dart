import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screens/authentication/intro/screens/app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        title: "Oxapp",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: App(),
      );
  }
}
