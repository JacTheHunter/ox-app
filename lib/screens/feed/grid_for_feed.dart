import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuckingnum/providers/feedGridProvider.dart';
import 'package:provider/provider.dart';
import 'gridfor_feed_item.dart';

class GridFor_Feed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    final gridData = Provider.of<FeedGridProvider>(context);
    final grid = gridData.items;

    return Padding(
      padding: EdgeInsets.fromLTRB(width * .05, 0, 0, 0),
      child: Container(
        height: 317,
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: grid.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) => ChangeNotifierProvider.value(
            value: grid[i],
            child: GridFor_FeedItem(),
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.4,
            crossAxisCount: 3,
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
          ),
        ),
      ),
    );
  }
}
