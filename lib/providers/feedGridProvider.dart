import 'package:flutter/cupertino.dart';
import 'package:fuckingnum/screens/models/ShopConstructor.dart';

class FeedGridProvider with ChangeNotifier {
  List<ShopConstructor> _items = [
    ShopConstructor(
      id: '0',
      image: 'icons/avva.png',
      appBar: "AVVA",
      discount: "10% discount",
      cashback: "5% cashback",
    ),
    ShopConstructor(
      id: '1',
      image: 'icons/skechers.png',
      appBar: "Skechers",
      discount: "15% discount",
      cashback: "5% cashback",
    ),
    ShopConstructor(
      id: '2',
      image: 'icons/etam.png',
      appBar: "Etam",
      discount: "10% discount",
      cashback: "7% cashback",
    ),
    ShopConstructor(
      id: '3',
      image: 'icons/derimod.png',
      appBar: "Derimod",
      discount: "10% discount",
      cashback: "5% cashback",
    ),
    ShopConstructor(
      id: '4',
      image: 'icons/avva.png',
      appBar: "AVVA",
      discount: "10% discount",
      cashback: "5% cashback",
    ),
    ShopConstructor(
      id: '5',
      image: 'icons/skechers.png',
      appBar: "Skechers",
      discount: "10% discount",
      cashback: "5% cashback",
    ),
  ];

  List<ShopConstructor> get items {
    return [..._items];
  }

  ShopConstructor findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }
}
