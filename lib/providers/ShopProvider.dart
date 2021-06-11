import 'package:flutter/cupertino.dart';
import 'package:fuckingnum/screens/models/ShopConstructor.dart';

class ShopProvider with ChangeNotifier {
  List<ShopConstructor> _items = [
    ShopConstructor(
        id: "0", image: 'icons/polo.png', appBar: "U.S. POLO ASSN."),
    ShopConstructor(id: "1", image: 'icons/okaidi.png', appBar: "OKAIDI"),
    ShopConstructor(id: "2", image: 'icons/morgan.png', appBar: "MORGAN"),
    ShopConstructor(id: "3", image: 'icons/chicco.png', appBar: "CHICCO"),
    ShopConstructor(id: "4", image: 'icons/iam.png', appBar: "I AM"),
    ShopConstructor(id: "5", image: 'icons/bata.png', appBar: "BATA"),
    ShopConstructor(
        id: "6", image: 'icons/polo.png', appBar: "U.S. POLO ASSN."),
    ShopConstructor(
        id: "7", image: 'icons/polo.png', appBar: "U.S. POLO ASSN."),
  ];

  List<ShopConstructor> get items {
    return [..._items];
  }

  ShopConstructor findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }
}
