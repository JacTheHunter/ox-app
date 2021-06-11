import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScannerPage extends StatefulWidget {
  @override
  _QRScannerPageState createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  GlobalKey qrKey = GlobalKey();
  var qrText = '';
  QRViewController _controller;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: height,
                width: width,
                child: QRView(
                  key: qrKey,
                  overlay: QrScannerOverlayShape(
                    borderRadius: 30,
                    borderColor: Colors.white,
                    borderLength: 50,
                    borderWidth: 5,
                    cutOutSize: 300,
                  ),
                  onQRViewCreated: _onQRViewCreate,
                ),
              ),
              AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                centerTitle: true,
                leading: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 35 / textScaleFactor,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                title: Text(
                  'Cканирую...',
                  style: TextStyle(
                    fontSize: 19 / textScaleFactor,
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Positioned(
                bottom: height * .05,
                child: qrText == ''
                    ? SizedBox()
                    : Container(
                  margin: EdgeInsets.only(left: width * .06),
                  width: width * 0.87,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        width: width * .09,
                        child: Image.asset(
                          'icons/socks.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: width * .06),
                      Container(
                        width: width * 0.25,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              qrText,
                              style: TextStyle(
                                fontSize: 16 / textScaleFactor,
                                fontFamily: 'Montserrat',
                                color: Color(0xFF627285),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              '900 000 UZS',
                              style: TextStyle(
                                fontSize: 16 / textScaleFactor,
                                fontFamily: 'Montserrat',
                                color: Color(0xFF0D3662),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: width * 0.3,
                      ),
                      Container(
                        width: width * .08,
                        height: height * .05,
                        decoration: BoxDecoration(
                          color: Color(0xFFECE1FE),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(11),
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            size: 20 / textScaleFactor,
                            color: Color(0xFF965EFF),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _onQRViewCreate(QRViewController controller) {
    this._controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrText = scanData;
      });
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
