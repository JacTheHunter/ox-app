import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'tab_bar_properties.dart';

final List<TabBarProperty> properties = [
  TabBarProperty(
    adress: 'г.Ташкент , Мирабадский \nрайон , ул.Нукус д.89',
    orient: 'Ориентир: Kapital bank',
    number: 'Тел.: 78 798 89 89',
    image: 'icons/polo1.jpg',
  ),
  TabBarProperty(
    adress: 'г.Ташкент , Мирабадский \nрайон , ул.Нукус д.89',
    orient: 'Ориентир: Kapital bank',
    number: 'Тел.: 78 798 89 89',
    image: 'icons/polo1.jpg',
  ),
  TabBarProperty(
    adress: 'г.Ташкент , Мирабадский \nрайон , ул.Нукус д.89',
    orient: 'Ориентир: Kapital bank',
    number: 'Тел.: 78 798 89 89',
    image: 'icons/polo1.jpg',
  ),
  TabBarProperty(
    adress: 'г.Ташкент , Мирабадский \nрайон , ул.Нукус д.89',
    orient: 'Ориентир: Kapital bank',
    number: 'Тел.: 78 798 89 89',
    image: 'icons/polo1.jpg',
  ),
  TabBarProperty(
    adress: 'г.Ташкент , Мирабадский \nрайон , ул.Нукус д.89',
    orient: 'Ориентир: Kapital bank',
    number: 'Тел.: 78 798 89 89',
    image: 'icons/polo1.jpg',
  ),
  TabBarProperty(
    adress: 'г.Ташкент , Мирабадский \nрайон , ул.Нукус д.89',
    orient: 'Ориентир: Kapital bank',
    number: 'Тел.: 78 798 89 89',
    image: 'icons/polo1.jpg',
  ),
  TabBarProperty(
    adress: 'г.Ташкент , Мирабадский \nрайон , ул.Нукус д.89',
    orient: 'Ориентир: Kapital bank',
    number: 'Тел.: 78 798 89 89',
    image: 'icons/polo1.jpg',
  ),
  TabBarProperty(
    adress: 'г.Ташкент , Мирабадский \nрайон , ул.Нукус д.89',
    orient: 'Ориентир: Kapital bank',
    number: 'Тел.: 78 798 89 89',
    image: 'icons/polo1.jpg',
  ),
  TabBarProperty(
    adress: 'г.Ташкент , Мирабадский \nрайон , ул.Нукус д.89',
    orient: 'Ориентир: Kapital bank',
    number: 'Тел.: 78 798 89 89',
    image: 'icons/polo1.jpg',
  ),
  TabBarProperty(
    adress: 'г.Ташкент , Мирабадский \nрайон , ул.Нукус д.89',
    orient: 'Ориентир: Kapital bank',
    number: 'Тел.: 78 798 89 89',
    image: 'icons/polo1.jpg',
  ),
  TabBarProperty(
    adress: 'г.Ташкент , Мирабадский \nрайон , ул.Нукус д.89',
    orient: 'Ориентир: Kapital bank',
    number: 'Тел.: 78 798 89 89',
    image: 'icons/polo1.jpg',
  ),
  TabBarProperty(
    adress: 'г.Ташкент , Мирабадский \nрайон , ул.Нукус д.89',
    orient: 'Ориентир: Kapital bank',
    number: 'Тел.: 78 798 89 89',
    image: 'icons/polo1.jpg',
  ),
];

class TabBarChild extends StatelessWidget {
  final int index;
  TabBarChild(this.index);
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.all(14),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      properties[index].adress,
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w400,
                        color: HexColor("#627285"),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      properties[index].orient,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Montserrat',
                        fontSize: 12,
                        color: HexColor("#627285"),
                      ),
                    ),
                    Text(
                      properties[index].number,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Montserrat',
                        fontSize: 12,
                        color: HexColor("#627285"),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: width / 3.9,
                  height: height / 7.5,
                  decoration: BoxDecoration(
                    color: HexColor('#979797'),
                    image: DecorationImage(
                        image: AssetImage(properties[index].image),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.all(Radius.circular(22.0)),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 0,
            width: MediaQuery.of(context).size.width,
            child: Divider(height: 0, color: HexColor('#979797')),
          ),
        ],
      ),
    );
  }
}
