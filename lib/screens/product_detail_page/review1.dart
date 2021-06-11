import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import '../../providers/reviewsProvider.dart';

class Review1 extends StatefulWidget {
  @override
  _Review1State createState() => _Review1State();
}

class _Review1State extends State<Review1> {
  String pros;
  String cons;

  void _settingModalBottomSheet(context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;
    var sheight = MediaQuery.of(context).viewInsets.bottom != null
        ? height / 40
        : height / 30;

    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(29),
          topLeft: Radius.circular(29.0),
        ),
      ),
      builder: (BuildContext bc) {
        return Container(
          height: height,
          width: width,
          child: Column(
            children: <Widget>[
              SizedBox(height: height / 50),
              Container(
                width: width / 10,
                height: height / 120,
                decoration: BoxDecoration(
                  color: Hexcolor("#EBF1FD"),
                  borderRadius: BorderRadius.circular(4.5),
                ),
              ),
              SizedBox(height: height / 20),
              buildCommentItem(),
              FlatButton(
                onPressed: () {
                  addComment(context);
                  Navigator.of(context).pop();
                },
                child: Text('Запостить'),
              ),
            ],
          ),
        );
      },
    );
  }

  void addComment(BuildContext ctx) {
    Provider.of<ReviewsProvider>(context, listen: false).addComm(pros, cons);
  }

  Widget buildCommentItem() {
    return Card(
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              labelText: 'Достоинства',
            ),
            onChanged: (value) {
              pros = value;
            },
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Недостатки',
            ),
            onChanged: (value) {
              cons = value;
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 0),
          child: Container(
            width: width,
            decoration: BoxDecoration(
              color: Hexcolor("#EBF1FD"),
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
            child: Padding(
              padding: EdgeInsets.all(17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "Вы не можете оставить отзыв",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      fontFamily: 'Montserrat',
                      color: Hexcolor("#0D3662"),
                    ),
                  ),
                  Text(
                    "Мы не нашли данный товар среди ваших покупок.Вы можете оставить отзыв к товарам которые приобретали ранее",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 10,
                      fontFamily: 'Montserrat',
                      color: Hexcolor("#0D3662"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.only(left: width * .05),
          child: RaisedButton(
            child: Text("Оставить отзыв"),
            onPressed: () {
              _settingModalBottomSheet(context);
            },
            color: Hexcolor("#EBF1FD"),
            textColor: Hexcolor("#B7C1D2"),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(31),
            ),
          ),
        ),
        //Padding(
        //  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
        //  child: Container(
        //    width: MediaQuery.of(context).size.width / 3,
        //    height: 38,
        //    decoration: BoxDecoration(
        //      color: Hexcolor("#EBF1FD"),
        //      borderRadius: BorderRadius.all(
        //        Radius.circular(25.0),
        //      ),
        //    ),
        //    child: Center(
        //      child: Text(
        //        "Оставить отзыв",
        //        textAlign: TextAlign.center,
        //        style: TextStyle(
        //          fontFamily: 'Montserrat',
        //          fontSize: 14,
        //          fontWeight: FontWeight.w500,
        //          color: Hexcolor("#B7C1D2"),
        //        ),
        //      ),
        //    ),
        //  ),
        //),
      ],
    );
  }
}
