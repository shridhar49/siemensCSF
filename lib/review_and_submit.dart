import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:customersatisfactionform/globals.dart' as globals;
import 'package:sprintf/sprintf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:intl/intl.dart';
class RNSPage extends StatefulWidget {
  @override
  RNSPageState createState() => RNSPageState();
}

class RNSPageState extends State<RNSPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          title: Text(
            'Review and Submit',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
            elevation: 18.0,
            label: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Text(
                    'Review form and Submit',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),

                ],
              ),
            ),
            backgroundColor: Colors.deepPurpleAccent,
            onPressed: () {
              generatePDF();
            }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child:  Icon(
                Icons.done,
                color: Colors.green,
                size: 60,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Thank you!',
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.black),
              ),
            ),
            Text(
              'Thank you for submitting your feedback.',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  generatePDF() async {
    final pdf = pw.Document();
    final siemens_energy = PdfImage.file(
      pdf.document,
      bytes: (await rootBundle.load('assets/img/siemens_energy.jpg'))
          .buffer
          .asUint8List(),
    );

    final signature = PdfImage.file(
      pdf.document,
      bytes: globals.signature.buffer.asUint8List(),
    );

    List<List<String>> salidas = new List();
    salidas.add(<String>['Quality Aspect', '1','2','3','4','5','6','7','8','9','10']);

    for (var indice = 0; indice < 10; indice++) {
      switch (indice) {
        case 0:
          var rating = globals.Q1rating.toInt();
          List<String> recind = <String>[
            globals.Q1,
            rating == 1 ? "*" : "",
            rating == 2 ? "*" : "",
            rating == 3 ? "*" : "",
            rating == 4 ? "*" : "",
            rating == 5 ? "*" : "",
            rating == 6 ? "*" : "",
            rating == 7 ? "*" : "",
            rating == 8 ? "*" : "",
            rating == 9 ? "*" : "",
            rating == 10 ? "*" : "",
          ];
          salidas.add(recind);
          break;
        case 1:
          var rating = globals.Q2rating.toInt();
          List<String> recind = <String>[
            globals.Q2,
            rating == 1 ? "*" : "",
            rating == 2 ? "*" : "",
            rating == 3 ? "*" : "",
            rating == 4 ? "*" : "",
            rating == 5 ? "*" : "",
            rating == 6 ? "*" : "",
            rating == 7 ? "*" : "",
            rating == 8 ? "*" : "",
            rating == 9 ? "*" : "",
            rating == 10 ? "*" : "",
          ];
          salidas.add(recind);
          break;
        case 2:
          var rating = globals.Q3rating.toInt();
          List<String> recind = <String>[
            globals.Q3,
            rating == 1 ? "*" : "",
            rating == 2 ? "*" : "",
            rating == 3 ? "*" : "",
            rating == 4 ? "*" : "",
            rating == 5 ? "*" : "",
            rating == 6 ? "*" : "",
            rating == 7 ? "*" : "",
            rating == 8 ? "*" : "",
            rating == 9 ? "*" : "",
            rating == 10 ? "*" : "",
          ];
          salidas.add(recind);
          break;
        case 3:
          var rating = globals.Q4rating.toInt();
          List<String> recind = <String>[
            globals.Q4,
            rating == 1 ? "*" : "",
            rating == 2 ? "*" : "",
            rating == 3 ? "*" : "",
            rating == 4 ? "*" : "",
            rating == 5 ? "*" : "",
            rating == 6 ? "*" : "",
            rating == 7 ? "*" : "",
            rating == 8 ? "*" : "",
            rating == 9 ? "*" : "",
            rating == 10 ? "*" : "",
          ];
          salidas.add(recind);
          break;
        case 4:
          var rating = globals.Q5rating.toInt();
          List<String> recind = <String>[
            globals.Q5,
            rating == 1 ? "*" : "",
            rating == 2 ? "*" : "",
            rating == 3 ? "*" : "",
            rating == 4 ? "*" : "",
            rating == 5 ? "*" : "",
            rating == 6 ? "*" : "",
            rating == 7 ? "*" : "",
            rating == 8 ? "*" : "",
            rating == 9 ? "*" : "",
            rating == 10 ? "*" : "",
          ];
          salidas.add(recind);
          break;
        case 5:
          var rating = globals.Q6rating.toInt();
          List<String> recind = <String>[
            globals.Q6,
            rating == 1 ? "*" : "",
            rating == 2 ? "*" : "",
            rating == 3 ? "*" : "",
            rating == 4 ? "*" : "",
            rating == 5 ? "*" : "",
            rating == 6 ? "*" : "",
            rating == 7 ? "*" : "",
            rating == 8 ? "*" : "",
            rating == 9 ? "*" : "",
            rating == 10 ? "*" : "",
          ];
          salidas.add(recind);
          break;
        case 6:
          var rating = globals.Q7rating.toInt();
          List<String> recind = <String>[
            globals.Q7,
            rating == 1 ? "*" : "",
            rating == 2 ? "*" : "",
            rating == 3 ? "*" : "",
            rating == 4 ? "*" : "",
            rating == 5 ? "*" : "",
            rating == 6 ? "*" : "",
            rating == 7 ? "*" : "",
            rating == 8 ? "*" : "",
            rating == 9 ? "*" : "",
            rating == 10 ? "*" : "",
          ];
          salidas.add(recind);
          break;
        case 7:
          var rating = globals.Q8rating.toInt();
          List<String> recind = <String>[
            globals.Q8,
            rating == 1 ? "*" : "",
            rating == 2 ? "*" : "",
            rating == 3 ? "*" : "",
            rating == 4 ? "*" : "",
            rating == 5 ? "*" : "",
            rating == 6 ? "*" : "",
            rating == 7 ? "*" : "",
            rating == 8 ? "*" : "",
            rating == 9 ? "*" : "",
            rating == 10 ? "*" : "",
          ];
          salidas.add(recind);
          break;
        case 8:
          var rating = globals.Q9rating.toInt();
          List<String> recind = <String>[
            globals.Q9,
            rating == 1 ? "*" : "",
            rating == 2 ? "*" : "",
            rating == 3 ? "*" : "",
            rating == 4 ? "*" : "",
            rating == 5 ? "*" : "",
            rating == 6 ? "*" : "",
            rating == 7 ? "*" : "",
            rating == 8 ? "*" : "",
            rating == 9 ? "*" : "",
            rating == 10 ? "*" : "",
          ];
          salidas.add(recind);
          break;
        case 9:
          var rating = globals.Q10rating.toInt();
          List<String> recind = <String>[
            globals.Q10,
            rating == 1 ? "*" : "",
            rating == 2 ? "*" : "",
            rating == 3 ? "*" : "",
            rating == 4 ? "*" : "",
            rating == 5 ? "*" : "",
            rating == 6 ? "*" : "",
            rating == 7 ? "*" : "",
            rating == 8 ? "*" : "",
            rating == 9 ? "*" : "",
            rating == 10 ? "*" : "",
          ];
          salidas.add(recind);
          break;
      }
    }

    pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Column(children: [
          pw.Column(
//              mainAxisAlignment: pw.MainAxisAlignment.center,
//              crossAxisAlignment: pw.CrossAxisAlignment.center,
              children: [
                pw.Align(
                  alignment: pw.Alignment.centerLeft,
                  child: pw.Container(
                    child: pw.Text(
                      "SIEMENS",
                      style: pw.TextStyle(
                          fontSize: ScreenUtil().setWidth(30),
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColors.black),
                    ),
                  ),
                ),
                pw.Column(
                    children: [
                      pw.Padding(
                          padding: const pw.EdgeInsets.all(10),
                          child: pw.FittedBox(
                              fit: pw.BoxFit.scaleDown,
                              child: pw.SizedBox(
                                child: pw.Text(
                                  "Measurement of Customer Satisfaction (Inspection)",
                                  softWrap: true,
                                  textAlign: pw.TextAlign.center,
                                  style: pw.TextStyle(
                                    color: PdfColors.deepPurpleAccent,
                                    fontSize: 14,
                                    fontWeight: pw.FontWeight.bold,
                                  ),
                                ),
                              ))),
                      pw.Padding(
                          padding: const pw.EdgeInsets.all(8.0),
                        child: pw.Row(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                            children: [
                              pw.Align(
                                child: pw.Column(
                                    children: [
                                      pw.Text(
                                        "Project Name : ${globals.projectName}",
                                        textAlign: pw.TextAlign.left,
                                        style: pw.TextStyle(
                                            fontWeight: pw.FontWeight.bold,
                                            color: PdfColors.black),
                                      ),
                                      pw.Text(
                                        "Client Name : ${globals.client}",
                                        textAlign: pw.TextAlign.left,
                                        style: pw.TextStyle(
                                            fontWeight: pw.FontWeight.bold,
                                            color: PdfColors.black),
                                      ),
                                    ]
                                ),
                              ),
                              pw.Align(
                                  child: pw.Column(
                                      children: [
                                        pw.Text(
                                          "Product Type : ${globals.typeOfProduct}",
                                          textAlign: pw.TextAlign.left,
                                          style: pw.TextStyle(
                                              fontWeight: pw.FontWeight.bold,
                                              color: PdfColors.black),
                                        ),
                                        pw.Text(
                                          "Date : ${DateFormat('dd MMM yyyy').format(
                                              DateTime.fromMillisecondsSinceEpoch(
                                                  globals.dateOfFeedback))}",
                                          textAlign: pw.TextAlign.left,
                                          style: pw.TextStyle(
                                              fontWeight: pw.FontWeight.bold,
                                              color: PdfColors.black),
                                        ),
                                      ]
                                  )
                              ),
                            ]
                        )
                      ),
                    ]
                ),

                pw.Text( "\n(Legend -> 1/2 : Very Dissatisfied, 3/4 : Dissatisfied,\n 5/6 :  Neutral, 7/8 : Satisfied, 9/10 : Very Satisfied )\n",),
                pw.Table.fromTextArray(context: context, data: salidas),
                pw.Text( "\nRemark : ${globals.remark}",),

              ]),

          pw.Expanded(
            child: pw.Align(
              alignment: pw.Alignment.bottomLeft,
              child: pw.Column(
                  mainAxisAlignment: pw.MainAxisAlignment.end,
                  children: [
                    pw.SizedBox(
                      height: 50,
                      width: 50,
                      child: pw.Image(signature),
                    ),
                    pw.Text(
                      "Customers Signature",
                      style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColors.black),
                    ),
                    pw.Text(
                      "Name : ${globals.client}",
                    ),
                    pw.Text(
                      "Designation : ${globals.designation}",
                    ),
                  ]
              ),
            ),
          ),
        ]);
      },
    ));

    Directory output = await getApplicationDocumentsDirectory();
    final bcareport = File("${output.path}/CSF.pdf");
    print(output);
    print(bcareport);
    await bcareport.writeAsBytesSync(pdf.save());
    OpenFile.open(bcareport.path);

//    try {
//      Uint8List bytes = bcareport.readAsBytesSync();
//      await Share.file(
//          'BCA Report and Analysis', 'BCAReport.pdf', bytes, 'text/csv');
//    } catch (e) {
//      print('error: $e');
//    }
  }
}
