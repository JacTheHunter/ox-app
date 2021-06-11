import 'package:flutter/cupertino.dart';
import 'package:fuckingnum/screens/models/my_buys_cosntructor.dart';

class MyBuys_Provider extends ChangeNotifier {
  List<MyBuys_Constructor> _items = [
    MyBuys_Constructor(
        id: '0',
        numberOrder: '21314',
        month: 'Май',
        date: ' 01, 2020',
        shop: 'Ox App',
        count: 12,
        price: '3 500 000',
        state: 'Завершено',
        colorState: false),
    MyBuys_Constructor(
        id: '1',
        numberOrder: '437347',
        month: 'Июнь',
        date: ' 01, 2020',
        shop: 'Colin’s SD',
        count: 2,
        price: '1 000 000',
        state: 'В процессе',
        colorState: true),
    MyBuys_Constructor(
        id: '2',
        numberOrder: '696798',
        month: 'Июль',
        date: ' 01, 2020',
        shop: 'Ox App',
        count: 4,
        price: '2 000 000',
        state: 'В процессе',
        colorState: true),
    MyBuys_Constructor(
        id: '3',
        numberOrder: '8709567',
        month: 'Август',
        date: ' 01, 2020',
        shop: 'Skechers',
        count: 8,
        price: '2 000 000',
        state: 'В процессе',
        colorState: true),
    MyBuys_Constructor(
        id: '4',
        numberOrder: '986547',
        month: 'Май',
        date: ' 01, 2020',
        shop: 'Polo',
        count: 9,
        price: '2 000 000',
        state: 'Завершено',
        colorState: false),
    MyBuys_Constructor(
        id: '5',
        numberOrder: '54768',
        month: 'Май',
        date: ' 01, 2020',
        shop: 'Celio',
        count: 3,
        price: '2 000 000',
        state: 'Завершено',
        colorState: false),
    MyBuys_Constructor(
        id: '6',
        numberOrder: '45856',
        month: 'Янв',
        date: ' 01, 2020',
        shop: 'Derimod',
        count: 2,
        price: '2 000 000',
        state: 'Возврат',
        colorState: false),
  ];

  List<MyBuys_Constructor> get items {
    return [..._items];
  }

  MyBuys_Constructor findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  void addProduct() {
    notifyListeners();
  }
}
