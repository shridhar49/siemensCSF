
import 'dart:convert';
import 'dart:math';
import 'dart:ui' as ui;
import 'package:customersatisfactionform/review_and_submit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_signature_pad/flutter_signature_pad.dart';
import 'package:customersatisfactionform/globals.dart' as globals;
import 'package:fluttertoast/fluttertoast.dart';

class signature_and_remark  extends StatefulWidget {
  @override
  SNRPageState createState() => SNRPageState();
}

class SNRPageState extends State<signature_and_remark> {


  var color = Colors.blue;
  var strokeWidth = 3.0;
  final _sign = GlobalKey<SignatureState>();
  TextEditingController _remark = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            height: 500,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Signature(
                  color: color,
                  key: _sign,
                  onSign: () {
                    final sign = _sign.currentState;
                    debugPrint('${sign.points.length} points in the signature');
                  },
//                  backgroundPainter: _WatermarkPaint("2.0", "2.0"),
                  strokeWidth: strokeWidth,
                ),
              ),
              color: Colors.black12,
            ),
          ),
//          _img.buffer.lengthInBytes == 0 ? Container() : LimitedBox(maxHeight: 200.0, child: Image.memory(_img.buffer.asUint8List())),
          TextField(
              textCapitalization: TextCapitalization.sentences,
              controller: _remark,
              maxLength: 50,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Muli'),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0.0),
                alignLabelWithHint: true,
//                      isDense: true,
                labelText: 'please enter remark',
              ),
              onChanged: (text) {
                setRemark(text);
              }),
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                      color: Colors.green,
                      onPressed: () async {
                        final sign = _sign.currentState;

                        final image = await sign.getData();
                        var data = await image.toByteData(format: ui.ImageByteFormat.png);

                        final encoded = base64.encode(data.buffer.asUint8List());
                        globals.signature = data;
                        debugPrint("onPressed " + encoded);

                        if(!sign.hasPoints ){
                          Fluttertoast.showToast(
                              msg: "Please fill the signature",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }else if(_remark.text.length == 0 ){
                          Fluttertoast.showToast(
                              msg: "Please add remark",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }else{
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (_) => RNSPage()),
                                  (Route<dynamic> route) => false);
                        }

                      },
                      child: Text("Next")),
                  MaterialButton(
                      color: Colors.grey,
                      onPressed: () {
                        final sign = _sign.currentState;
                        sign.clear();
                        globals.signature = null;
                        debugPrint("cleared");
                      },
                      child: Text("Clear")),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  setRemark(String remark){
    globals.remark = remark;

  }


}




