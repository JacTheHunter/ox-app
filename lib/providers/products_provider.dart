import 'package:flutter/cupertino.dart';
import 'package:fuckingnum/screens/models/pdp_constructor.dart';

class Products with ChangeNotifier {
  List<PDP_Constructor> _items = [
    PDP_Constructor(
        id: "0",
        image: 'images/girl1.jpg',
        title: 'Куртка',
        price: 5500000,
        oldPrice: 10500000,
        isFavourite: true,
        colors: [
          '#B7C1D2',
          '#FF2D87',
          '#FF8A3D',
          '#0E3763',
          '#9090AA',
        ],
        sizes: [
          'X',
          'XS',
          'XL',
          'M',
          'S'
        ]),
    PDP_Constructor(
        id: "1",
        image: 'images/girl2.jpg',
        title: 'Джинсы',
        price: 3000000,
        isFavourite: true,
        colors: [
          '#777777',
          '#CC4587',
          '#ABC123',
          '#AAFF67',
          '#9090AA',
        ],
        sizes: [
          'XS',
          'XL',
          'M',
          'X',
          'S'
        ]),
    PDP_Constructor(
        id: "2",
        image: 'images/girl3.jpg',
        title: 'Леггинсы',
        price: 500000,
        oldPrice: 50000,
        colors: [
          '#ABC123',
          '#AAFF67',
          '#777777',
          '#CC4587',
          '#9090AA',
        ],
        sizes: [
          'S',
          'X',
          'XS',
          'XL',
          'M',
        ]),
    PDP_Constructor(
        id: "3",
        image: 'images/girl4.jpg',
        title: 'Кроссовки',
        price: 5100000,
        colors: [
          '#9090AA',
          '#AAFF67',
          '#777777',
          '#CC4587',
          '#ABC123',
        ],
        sizes: [
          'X',
          'XS',
          'XL',
          'M',
          'S'
        ]),
    PDP_Constructor(
        id: "4",
        image: 'images/girl5.jpg',
        title: 'Майка',
        price: 3500000,
        oldPrice: 100000,
        isFavourite: true,
        colors: [
          '#777777',
          '#AAFF67',
          '#CC4587',
          '#ABC123',
          '#9090AA',
        ],
        sizes: [
          'X',
          'XS',
          'XL',
          'M',
          'S'
        ]),
    PDP_Constructor(
        id: "5",
        image: 'images/girl6.jpg',
        title: 'Свитер',
        price: 1500000,
        colors: [
          '#CC4587',
          '#AAFF67',
          '#ABC123',
          '#9090AA',
          '#777777',
        ],
        sizes: [
          'X',
          'XS',
          'XL',
          'M',
          'S'
        ]),
    PDP_Constructor(
        id: "6",
        image: 'images/girl7.jpg',
        title: 'Топик',
        price: 5500000,
        oldPrice: 12500000,
        colors: [
          '#AAFF67',
          '#777777',
          '#CC4587',
          '#ABC123',
          '#9090AA',
        ],
        sizes: [
          'X',
          'XS',
          'XL',
          'M',
          'S'
        ]),
    PDP_Constructor(
        id: "7",
        image: 'images/girl8.jpg',
        title: 'Джогеры',
        price: 4200000,
        oldPrice: 1200000,
        colors: [
          '#AAFF67',
          '#777777',
          '#CC4587',
          '#ABC123',
          '#9090AA',
        ],
        sizes: [
          'X',
          'XS',
          'XL',
          'M',
          'S'
        ]),
  ];

  List<PDP_Constructor> get items {
    return [..._items];
  }

  PDP_Constructor findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  void updateFavorite(String id, bool favorite) {
    findById(id).isFavourite = favorite;
    notifyListeners();
  }

  void addProduct() {
    notifyListeners();
  }
}
