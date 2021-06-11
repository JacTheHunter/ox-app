import 'package:flutter/material.dart';
import 'package:fuckingnum/providers/bottom_navigation_provider.dart';
import 'package:provider/provider.dart';

class OxScrollView extends StatelessWidget {
  ScrollController _scrollController;
  Widget _widget;
  Key _key;

  OxScrollView(this._scrollController, this._widget, this._key);

  bool _isEnd = false;

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() {
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        this._isEnd = true;
        Provider.of<BottomNavigationProvider>(context, listen: false)
            .scrollBegin();
      } else {
        this._isEnd = false;
      }
    });
    return NotificationListener<ScrollNotification>(
      key: this._key,
      onNotification: (scrollNotification) {
        if (scrollNotification.depth != 0) return false;
        if (scrollNotification.context.widget.key.hashCode ==
            this._key.hashCode) {
          return false;
        }

        if (scrollNotification is ScrollStartNotification) {
//          Provider.of<BottomNavigationProvider>(context, listen: false)
//              .scrollBegin();
        } else if (scrollNotification is ScrollUpdateNotification) {
//            _onUpdateScroll(scrollNotification.metrics);
          if (scrollNotification.scrollDelta < 0) {
            Provider.of<BottomNavigationProvider>(context, listen: false)
                .scrollFinish();
          } else if (scrollNotification.scrollDelta > 0) {
            Provider.of<BottomNavigationProvider>(context, listen: false)
                .scrollBegin();
          }
        } else if (scrollNotification is ScrollEndNotification) {
//          if (!_isEnd) {
//            Provider.of<BottomNavigationProvider>(context, listen: false)
//                .scrollFinish();
//          }
        }
        return false;
      },
      child: SingleChildScrollView(
        controller: this._scrollController,
        child: this._widget,
      ),
    );
  }
}
