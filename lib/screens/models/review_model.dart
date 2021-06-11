import 'package:flutter/cupertino.dart';

class ReviewConstructor extends ChangeNotifier {
  final String id;
  final String image;
  final String name;
  final String date;
  final String color;
  final String size;
  final String company;
  final String benefits;
  final String disadventages;

  ReviewConstructor(
      {this.id,
      this.image,
      this.name,
      this.date,
      this.color,
      this.size,
      this.company,
      this.benefits,
      this.disadventages});
}
