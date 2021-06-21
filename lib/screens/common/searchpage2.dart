import 'dart:convert';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuckingnum/screens/common/searchpage.dart';
import 'package:fuckingnum/screens/models/note.dart';
import 'package:fuckingnum/screens/more/mybuys/list_buys.dart';
import 'package:fuckingnum/screens/qrcode/qr_scanner_page.dart';
import 'package:fuckingnum/screens/shopingpage/list_of_products.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int _selectedCat1 = 0;

  List<Note> _notes = List<Note>();
  List<Note> _notesForDisplay = List<Note>();

  Future<List<Note>> fetchNotes() async {
    var url =
        'https://raw.githubusercontent.com/boriszv/json/master/random_example.json';
    var response = await http.get(Uri.parse(url));

    var notes = List<Note>();

    if (response.statusCode == 200) {
      var notesJson = json.decode(response.body);
      for (var noteJson in notesJson) {
        notes.add(Note.fromJson(noteJson));
      }
    }
    return notes;
  }

  @override
  void initState() {
    fetchNotes().then((value) {
      setState(() {
        _notes.addAll(value);
        _notesForDisplay = _notes;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;
    final appbar = AppBar(
      elevation: 0.0,
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: HexColor("#0D3662"),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
    var redundant =
        appbar.preferredSize.height + MediaQuery.of(context).padding.top;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appbar,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                    left: width / 20, top: (height - redundant) * .03),
                child: Text(
                  'Что Вы ищите?',
                  style: TextStyle(
                      color: Color(0xFF0D3662),
                      fontFamily: 'Montserrat',
                      fontSize: 19 / textScaleFactor,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: (height - redundant) * .02),
              Padding(
                padding: EdgeInsets.all(20),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: "Рубашка",
                  ),
                  onTap: () {
                    showSearch(context: context, delegate: DataSearch());
                  },
                  style: TextStyle(
                      color: Colors.pink,
                      fontWeight: FontWeight.bold,
                      fontSize: 36),
                ),
              ),
              //Container(
              //  margin: EdgeInsets.only(left: width / 20),
              //  child: Text(
              //    'Рубашка',
              //    style: TextStyle(
              //        color: Color(0xFFFF2D87),
              //        fontFamily: 'Montserrat',
              //        fontSize: 36 / textScaleFactor,
              //        fontWeight: FontWeight.bold),
              //  ),
              //),
              SizedBox(height: (height - redundant) * .04),

              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(width * .04, 0, 0, 0),
                      child: Container(
                        height: 60,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: items.length,
                          itemBuilder: (context, i) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 10),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(9.0),
                                onTap: () {
                                  setState(
                                    () {
                                      _selectedCat1 = i;
                                    },
                                  );
                                },
                                child: Container(
                                  height: 37,
                                  decoration: BoxDecoration(
                                    color: _selectedCat1 == i
                                        ? HexColor("#965EFF")
                                        : HexColor("#EBF1FD"),
                                    borderRadius: BorderRadius.circular(9.0),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      child: Text(
                                        "${items[i].title}",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 14 / textScaleFactor,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w400,
                                          color: _selectedCat1 == i
                                              ? Colors.white
                                              : HexColor("#627285"),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: (height - redundant) * .07),
                    Container(
                      margin: EdgeInsets.only(left: width / 20),
                      child: Text(
                        'Недавно Вы искали',
                        style: TextStyle(
                            color: Color(0xFF0D3662),
                            fontFamily: 'Montserrat',
                            fontSize: 19 / textScaleFactor,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(height: (height - redundant) * .02),
                    List_Of_Products(),
                    SizedBox(height: (height - redundant) * .045),
                    Center(
                      child: Container(
                        height: height / 15,
                        child: RaisedButton.icon(
                          elevation: 0.0,
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (ctx) => QRScannerPage(),
                              ),
                            );
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(31),
                          ),
                          icon: SvgPicture.asset('icons/scan.svg'),
                          label: Text(
                            'ОТСКАНИРОВАТЬ ШТРИХ-КОД',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Montserrat',
                                fontSize: 13 / textScaleFactor,
                                fontWeight: FontWeight.w500),
                          ),
                          color: Color(0xFFFF2D87),
                        ),
                      ),
                    ),
                    SizedBox(height: height * .03),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
