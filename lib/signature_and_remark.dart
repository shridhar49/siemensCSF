
import 'dart:convert';
import 'dart:math';
import 'dart:ui' as ui;
import 'package:customersatisfactionform/review_and_submit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      appBar: AppBar(
        title: Text("Remark & Signature"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: _remark,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              maxLines: 5,
              maxLength: 250,
              maxLengthEnforced: true,
              decoration: InputDecoration(
                labelText: 'Remark',
                hintText: 'please enter remark',
                alignLabelWithHint: true,
                labelStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
              ),
                onChanged: (text) {
                  setRemark(text);
                },
              style: TextStyle(fontSize: 20.0, color: Colors.black),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(10),
              child: Text("Signature box")
          ),
          SizedBox(
            width: double.infinity,
            height: ScreenUtil().setHeight(300),
            child: Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black)
              ),
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
          ),
//          _img.buffer.lengthInBytes == 0 ? Container() : LimitedBox(maxHeight: 200.0, child: Image.memory(_img.buffer.asUint8List())),

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




