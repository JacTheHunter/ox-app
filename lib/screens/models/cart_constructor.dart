import 'package:flutter/foundation.dart';

class CartItem {
  final String image;
  final String id;
  final String title;
  int quantity;
  final int price;
  final int oldPrice;
  final String color;
  final String size;
  final String productId;

  CartItem({
    @required this.image,
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.price,
    @required this.oldPrice,
    @required this.color,
    @required this.size,
    @required this.productId,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  int get totalAmount {
    var total = 0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(String image, String productId, int price, int oldPrice,
      String title, String color, String size,
      {int quantity = 1}) {
    if (_items.containsKey(productId)) {
      // change quantity...
      //not good increasing quantity inside update it should separate (increase ,decrease )
//      _items.update(
//        productId,
//        (existingCartItem) => CartItem(
//          image: existingCartItem.image,
//          id: existingCartItem.id,
//          title: existingCartItem.title,
//          price: existingCartItem.price,
//          quantity: existingCartItem.quantity + 1,
//        ),
//      );
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
            image: image,
            id: DateTime.now().toString(),
            title: title,
            price: price,
            oldPrice: oldPrice,
            quantity: quantity,
            color: color,
            productId: productId,
            size: size),
      );
    }
    notifyListeners();
  }

  void increaseQuantity(String productId) {
    var cartItem = _items[productId];
    if (cartItem == null) return;
    cartItem.quantity = cartItem.quantity + 1;
    notifyListeners();
  }

  void decreaseQuantity(String productId) {
    var cartItem = _items[productId];
    if (cartItem == null) return;
    cartItem.quantity =
        cartItem.quantity >= 1 ? cartItem.quantity - 1 : cartItem.quantity;
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }
}
