import 'package:flutter/cupertino.dart';
import 'package:fuckingnum/screens/models/review_model.dart';

class ReviewsProvider extends ChangeNotifier {
  List<ReviewConstructor> _items = [
    ReviewConstructor(
      id: "0",
      image: "icons/julia.jpg",
      name: "Юля Александровна",
      date: "12.06.20",
      color: "Белый",
      size: "X",
      company: "Ox App",
      benefits:
          "Смотрится добротно , тёплый , длинный (на рост 163 44 размер будет почти до щиколотки).",
      disadventages:
          "Рукав коротковат , не критично , но для зимней одежды это как минимум странно .За это минус , но звёздочек вставлю пять.",
    ),
    ReviewConstructor(
      id: "1",
      image: "icons/julia.jpg",
      name: "Юля Александровна",
      date: "12.06.20",
      color: "Белый",
      size: "X",
      company: "Ox App",
      benefits:
          "Смотрится добротно , тёплый , длинный (на рост 163 44 размер будет почти до щиколотки).",
      disadventages:
          "Рукав коротковат , не критично , но для зимней одежды это как минимум странно .За это минус , но звёздочек вставлю пять.",
    ),
    ReviewConstructor(
      id: "2",
      image: "icons/julia.jpg",
      name: "Юля Александровна",
      date: "12.06.20",
      color: "Белый",
      size: "X",
      company: "Ox App",
      benefits:
          "Смотрится добротно , тёплый , длинный (на рост 163 44 размер будет почти до щиколотки).",
      disadventages:
          "Рукав коротковат , не критично , но для зимней одежды это как минимум странно .За это минус , но звёздочек вставлю пять.",
    ),
  ];

  List<ReviewConstructor> get items {
    return [..._items];
  }

  void addComm(String pros, String cons) {
    _items.insert(
        0,
        ReviewConstructor(
          id: "8",
          image: "icons/julia.jpg",
          name: "GELO PAK",
          date: "12.06.20",
          color: "Белый",
          size: "X",
          company: "Ox App",
          benefits: pros,
          disadventages: cons,
        ));
    notifyListeners();
  }

  ReviewConstructor findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }
}
