import 'package:flutter/material.dart';

class MySales extends StatefulWidget {
  @override
  _MySales createState() => _MySales();
}

class _MySales extends State<MySales> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back , color: Colors.black,),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "My Sales",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          "My Sales",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
