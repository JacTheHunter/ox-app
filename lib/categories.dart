import 'package:flutter/material.dart';

Color bgColor = Color(0xfff5f5f5);

class Categories {
  final String image;
  final String title;
  final int id;
  final List<SubCategories> subCat;

  Categories({this.image, this.title, this.id, this.subCat});
}

class SubCategories {
  final String title;
  final int id;
  final List<SubSubCategories> subSubCat;

  SubCategories({this.title, this.id, this.subSubCat});
}

class SubSubCategories {
  final String title;
  final String image;
  final int id;

  SubSubCategories({this.image, this.title, this.id});
}

List<Categories> categories = [
  Categories(
    image: 'icons/hanger.svg',
    title: 'Одежда , обувь и аксессуары',
    id: 0,
    subCat: [
      SubCategories(
        title: 'Женщинам',
        id: 0,
        subSubCat: [
          SubSubCategories(title: 'Одежда', id: 0),
          SubSubCategories(title: 'Обувь', id: 1),
          SubSubCategories(title: 'Аксессуары', id: 2),
          SubSubCategories(title: 'Чулки , носки , колготки', id: 3),
          SubSubCategories(title: 'Домашняя одежда', id: 4),
          SubSubCategories(title: 'Одежда для беременных', id: 5),
          SubSubCategories(title: 'Одежда', id: 6),
        ],
      ),
      SubCategories(title: 'Мужчинам', id: 1),
      SubCategories(title: 'Детям', id: 2),
      SubCategories(title: 'Спорт', id: 3),
      SubCategories(title: 'ТОП Бренды', id: 4),
      SubCategories(title: 'Уход за одеждой и обувью', id: 5),
    ],
  ),
  Categories(
    image: 'icons/controller.svg',
    title: 'Детские товары',
    id: 1,
    subCat: [
      SubCategories(
        id: 0,
        title: "OXFORD",
        subSubCat: [
          SubSubCategories(title: 'Clothes', id: 0),
        ],
      ),
      SubCategories(
        id: 1,
        title: "DERBY",
        subSubCat: [
          SubSubCategories(title: 'Clothes', id: 0),
        ],
      ),
      SubCategories(
        id: 2,
        title: "MEN’S BOOTS",
        subSubCat: [
          SubSubCategories(title: 'Clothes', id: 0),
        ],
      ),
      SubCategories(
        id: 3,
        title: "MOCCASIN",
        subSubCat: [
          SubSubCategories(title: 'Clothes', id: 0),
        ],
      ),
      SubCategories(
        id: 4,
        title: "LOAFER",
        subSubCat: [
          SubSubCategories(title: 'Clothes', id: 0),
        ],
      ),
      SubCategories(
        id: 5,
        title: "BLUCHER",
        subSubCat: [
          SubSubCategories(title: 'Clothes', id: 0),
        ],
      ),
      SubCategories(
        id: 6,
        title: "BOAT SHOE",
        subSubCat: [
          SubSubCategories(title: 'Clothes', id: 0),
        ],
      ),
      SubCategories(
        id: 7,
        title: "MONK",
        subSubCat: [
          SubSubCategories(title: 'Clothes', id: 0),
        ],
      ),
      SubCategories(
        id: 8,
        title: "STRAP",
        subSubCat: [
          SubSubCategories(title: 'Clothes', id: 0),
        ],
      ),
      SubCategories(
        id: 9,
        title: "BUDAPESTER",
        subSubCat: [
          SubSubCategories(title: 'Clothes', id: 0),
        ],
      ),
      SubCategories(
        id: 10,
        title: "BUCKLED SHOES",
        subSubCat: [
          SubSubCategories(title: 'Clothes', id: 0),
        ],
      ),
      SubCategories(
        id: 11,
        title: "LACE-UP SHOES",
        subSubCat: [
          SubSubCategories(title: 'Clothes', id: 0),
        ],
      ),
      SubCategories(
        id: 12,
        title: "SLIP-ON SHOES",
        subSubCat: [
          SubSubCategories(title: 'Clothes', id: 0),
        ],
      ),
    ],
  ),
  Categories(
    image: 'icons/cup.svg',
    title: 'Красота и здоровье',
    id: 2,
    subCat: [
      SubCategories(id: 0, title: "Jackets and coats"),
      SubCategories(id: 1, title: "Trousers and shorts"),
      SubCategories(id: 2, title: "Underwear"),
      SubCategories(id: 3, title: "Suits"),
      SubCategories(id: 4, title: "Skirts and dresses"),
      SubCategories(id: 5, title: "Sweaters and waistcoats"),
    ],
  ),
  Categories(
    image: 'icons/cup.svg',
    title: 'Красота и здоровье',
    id: 3,
    subCat: [
      SubCategories(id: 0, title: "Microwave oven"),
      SubCategories(id: 1, title: "Stacked washing machine \& clothes dryer"),
      SubCategories(id: 2, title: "Gas fireplace"),
      SubCategories(id: 3, title: "Refrigerators"),
      SubCategories(id: 4, title: "Vacuum cleaner"),
      SubCategories(id: 5, title: "Electric water heater tank"),
      SubCategories(id: 6, title: "Small twin window fan"),
    ],
  ),
  Categories(
    image: 'icons/cup.svg',
    title: 'Красота и здоровье',
    id: 4,
    subCat: [
      SubCategories(id: 0, title: "Microwave oven"),
      SubCategories(id: 1, title: "Stacked washing machine \& clothes dryer"),
      SubCategories(id: 2, title: "Gas fireplace"),
      SubCategories(id: 3, title: "Refrigerators"),
      SubCategories(id: 4, title: "Vacuum cleaner"),
      SubCategories(id: 5, title: "Electric water heater tank"),
      SubCategories(id: 6, title: "Small twin window fan"),
    ],
  ),
  Categories(
    image: 'icons/cup.svg',
    title: 'Красота и здоровье',
    id: 5,
    subCat: [
      SubCategories(id: 0, title: "Microwave oven"),
      SubCategories(id: 1, title: "Stacked washing machine \& clothes dryer"),
      SubCategories(id: 2, title: "Gas fireplace"),
      SubCategories(id: 3, title: "Refrigerators"),
      SubCategories(id: 4, title: "Vacuum cleaner"),
      SubCategories(id: 5, title: "Electric water heater tank"),
      SubCategories(id: 6, title: "Small twin window fan"),
    ],
  ), Categories(
    image: 'icons/cup.svg',
    title: 'Красота и здоровье',
    id: 6,
    subCat: [
      SubCategories(id: 0, title: "Microwave oven"),
      SubCategories(id: 1, title: "Stacked washing machine \& clothes dryer"),
      SubCategories(id: 2, title: "Gas fireplace"),
      SubCategories(id: 3, title: "Refrigerators"),
      SubCategories(id: 4, title: "Vacuum cleaner"),
      SubCategories(id: 5, title: "Electric water heater tank"),
      SubCategories(id: 6, title: "Small twin window fan"),
    ],
  ), Categories(
    image: 'icons/cup.svg',
    title: 'Красота и здоровье',
    id: 7,
    subCat: [
      SubCategories(id: 0, title: "Microwave oven"),
      SubCategories(id: 1, title: "Stacked washing machine \& clothes dryer"),
      SubCategories(id: 2, title: "Gas fireplace"),
      SubCategories(id: 3, title: "Refrigerators"),
      SubCategories(id: 4, title: "Vacuum cleaner"),
      SubCategories(id: 5, title: "Electric water heater tank"),
      SubCategories(id: 6, title: "Small twin window fan"),
    ],
  ), Categories(
    image: 'icons/cup.svg',
    title: 'Красота и здоровье',
    id: 8,
    subCat: [
      SubCategories(id: 0, title: "Microwave oven"),
      SubCategories(id: 1, title: "Stacked washing machine \& clothes dryer"),
      SubCategories(id: 2, title: "Gas fireplace"),
      SubCategories(id: 3, title: "Refrigerators"),
      SubCategories(id: 4, title: "Vacuum cleaner"),
      SubCategories(id: 5, title: "Electric water heater tank"),
      SubCategories(id: 6, title: "Small twin window fan"),
    ],
  ), Categories(
    image: 'icons/cup.svg',
    title: 'Красота и здоровье',
    id: 9,
    subCat: [
      SubCategories(id: 0, title: "Microwave oven"),
      SubCategories(id: 1, title: "Stacked washing machine \& clothes dryer"),
      SubCategories(id: 2, title: "Gas fireplace"),
      SubCategories(id: 3, title: "Refrigerators"),
      SubCategories(id: 4, title: "Vacuum cleaner"),
      SubCategories(id: 5, title: "Electric water heater tank"),
      SubCategories(id: 6, title: "Small twin window fan"),
    ],
  ),




];
