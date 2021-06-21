import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

class PromList_Item extends StatelessWidget {
  final String title;
  final String image;

  PromList_Item(this.title, this.image);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(
        right: width * .03,
      ),
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: HexColor("#FFD3E6"), width: 1.2),
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) => Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding:
                    EdgeInsets.fromLTRB(width * .035, height * .01, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Montserrat',
                            color: HexColor('#0D3662'),
                          ),
                        ),
                        SizedBox(height: constraints.maxHeight * 0.1),
                        Text(
                          "Подробнее об акции",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400,
                            fontSize: 12.0,
                            color: HexColor("#0D3662"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: height * .05, right: width * .01),
                    child: SvgPicture.asset(
                      image,
                      height: height * .052,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: height * .121,
            left: width * .085,
            right: width * .085,
            child: Container(
              //padding: EdgeInsets.all(10),
              height: height * .005,
              width: width * .3,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFFFF2D87)),
            ),
          ),
        ],
      ),
    );
  }
}
