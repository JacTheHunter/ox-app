import 'package:flutter/foundation.dart';

//this provider stores only page state
class ProductPageProvider extends ChangeNotifier {
  //Product id and its own selected color state
  Map<String, String> productColor = {};

  //Product id and its own selected size state
  Map<String, String> productSize = {};

  void selectProductColor(String productId, String color) {
    productColor[productId] = color;
    notifyListeners();
  }

  void selectProductSize(String productId, String size) {
    productSize[productId] = size;
    notifyListeners();
  }

  String getProductColor(String productId) {
    var containsKey = productColor.containsKey(productId);
    if (!containsKey) return null;
    return productColor[productId];
  }

  String getProductSize(String productId) {
    var containsKey = productSize.containsKey(productId);
    if (!containsKey) return null;
    return productSize[productId];
  }
}
