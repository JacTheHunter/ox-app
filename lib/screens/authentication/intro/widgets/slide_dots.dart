import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SlideDots extends StatelessWidget {
  final bool isActive;
  SlideDots(this.isActive);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 7),
      height: isActive ? 10 : 10,
      width: isActive ? 10 : 10,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Hexcolor("#B7C1D2"),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
