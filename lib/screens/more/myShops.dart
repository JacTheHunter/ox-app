import 'package:flutter/material.dart';
import 'package:fuckingnum/providers/feedGridProvider.dart';
import 'package:fuckingnum/screens/feed/gridfor_feed_item.dart';
import 'package:provider/provider.dart';

class MyShops extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final listData = Provider.of<FeedGridProvider>(context);
    final list = listData.items;
    return Scaffold(
      backgroundColor: Color(0xFFEBEFF9),
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xFF0D3662),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Мои магазины',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Color(0xFF0D3662),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20),
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, i) => ChangeNotifierProvider.value(
            child: Padding(
              child: GridFor_FeedItem(),
              padding: EdgeInsets.all(5),
            ),
            value: list[i],
          ),
        ),
      ),
    );
  }
}
