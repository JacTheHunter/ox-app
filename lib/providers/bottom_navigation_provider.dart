import 'package:flutter/foundation.dart';

class BottomNavigationProvider extends ChangeNotifier {
  bool _scrolling;

  int _tabIndex;

  bool get scrolling => _scrolling;

  set scrolling(bool value) {
    _scrolling = value;
  }

  int get tabIndex => _tabIndex;

  set tabIndex(int value) {
    _tabIndex = value;
  }

  void scrollBegin() {
    scrolling = true;
    notifyListeners();
  }

  void scrollFinish() {
    scrolling = false;
    notifyListeners();
  }

  BottomNavigationProvider() {
    scrolling = false;
  }

  void updateBottomTabBarIndex(int index) {
    tabIndex = index;
    notifyListeners();
  }
}

class BottomNavigationTabIndexProvider extends ChangeNotifier {
  int _tabIndex;

  int get tabIndex => _tabIndex;

  set tabIndex(int value) {
    _tabIndex = value;
  }

  void updateBottomTabBarIndex(int index) {
    tabIndex = index;
    notifyListeners();
  }
}
