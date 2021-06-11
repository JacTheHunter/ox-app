import 'package:flutter/cupertino.dart';

class PDP_Constructor with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final String image;
  final int price;
  final int oldPrice;
  bool isFavourite;
  List<String> colors;
  List<String> sizes;

  PDP_Constructor(
      {this.id,
      this.title,
      this.description,
      this.image,
      this.price,
      this.oldPrice,
      this.isFavourite = false,
      this.colors,
      this.sizes});

  void toggleFavoriteStatus() {
    isFavourite = !isFavourite;
    notifyListeners();
  }
}
