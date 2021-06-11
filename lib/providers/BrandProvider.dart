import 'package:flutter/cupertino.dart';
import 'package:fuckingnum/screens/models/grid_brand_constructor.dart';

class BrandProvider with ChangeNotifier {
  List<GridConstructor> _items = [
    GridConstructor(id: "0", image: 'icons/polo.png'),
    GridConstructor(id: "1", image: 'icons/okaidi.png'),
    GridConstructor(id: "2", image: 'icons/morgan.png'),
    GridConstructor(id: "3", image: 'icons/chicco.png'),
    GridConstructor(id: "4", image: 'icons/iam.png'),
    GridConstructor(id: "5", image: 'icons/bata.png'),
    GridConstructor(id: "6", image: 'icons/polo.png'),
    GridConstructor(id: "7", image: 'icons/polo.png'),
  ];

  List<GridConstructor> get items {
    return [..._items];
  }

  GridConstructor findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }
}
