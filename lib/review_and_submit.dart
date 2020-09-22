import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:customersatisfactionform/globals.dart' as globals;
import 'package:sprintf/sprintf.dart';
import 'package:pdf/widgets.dart' as pw;

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

    List<List<String>> salidas = new List();
    salidas.add(<String>['Quality Aspect', 'Satisfaction Level']);

    for (var indice = 0; indice < 10; indice++) {
      switch (indice) {
        case 0:
          List<String> recind = <String>[
            globals.Q1,
            sprintf("%.1f", [globals.Q1rating]),
//            globals.Q1remark
          ];
          salidas.add(recind);
          break;
        case 1:
          List<String> recind = <String>[
            globals.Q2,
            sprintf("%.1f", [globals.Q2rating]),
//            globals.Q2remark
          ];
          salidas.add(recind);
          break;
        case 2:
          List<String> recind = <String>[
            globals.Q3,
            sprintf("%.1f", [globals.Q3rating]),
//            globals.Q3remark
          ];
          salidas.add(recind);
          break;
        case 3:
          List<String> recind = <String>[
            globals.Q4,
            sprintf("%.1f", [globals.Q4rating]),
//            globals.Q4remark
          ];
          salidas.add(recind);
          break;
        case 4:
          List<String> recind = <String>[
            globals.Q5,
            sprintf("%.1f", [globals.Q5rating]),
//            globals.Q5remark
          ];
          salidas.add(recind);
          break;
        case 5:
          List<String> recind = <String>[
            globals.Q6,
            sprintf("%.1f", [globals.Q6rating]),
//            globals.Q6remark
          ];
          salidas.add(recind);
          break;
        case 6:
          List<String> recind = <String>[
            globals.Q7,
            sprintf("%.1f", [globals.Q7rating]),
//            globals.Q7remark
          ];
          salidas.add(recind);
          break;
        case 7:
          List<String> recind = <String>[
            globals.Q8,
            sprintf("%.1f", [globals.Q8rating]),
//            globals.Q8remark
          ];
          salidas.add(recind);
          break;
        case 8:
          List<String> recind = <String>[
            globals.Q9,
            sprintf("%.1f", [globals.Q9rating]),
//            globals.Q9remark
          ];
          salidas.add(recind);
          break;
        case 9:
          List<String> recind = <String>[
            globals.Q10,
            sprintf("%.1f", [globals.Q10rating]),
//            globals.Q10remark
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
              mainAxisAlignment: pw.MainAxisAlignment.center,
              crossAxisAlignment: pw.CrossAxisAlignment.center,
              children: [
                pw.Row(
                  children: [
                    pw.SizedBox(
                      height: 50,
                      width: 50,
                      child: pw.Image(siemens_energy),
                    ),
                    pw.Column(
                      children: [
                        pw.Padding(
                            padding: pw.EdgeInsets.only(right : 5,top: 5, bottom: 8),
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
                        pw.Column(
                          children: [
                            pw.Column(
                              children: [
                                pw.Text(
                                  "Project Name : ${globals.projectName}",
                                ),
                                pw.Text(
                                  "Client Name : ${globals.client}",
                                ),
                              ]
                            ),
                            pw.Column(
                                children: [
                                  pw.Text(
                                    "Product Type : ${globals.typeOfProduct}",
                                  ),
                                  pw.Text(
                                    "Date : ${globals.dateOfFeedback}",
                                  ),
                                ]
                            )
                          ]
                        )
                      ]
                    )
                  ]
                ),


                pw.Table.fromTextArray(context: context, data: salidas),
                pw.Text( "\n(Legend -> 1/2 : Very Dissatisfied, 3/4 : Dissatisfied, 5/6 :  Neutral, 7/8 : Satisfied, 9/10 : Very Satisfied )",)
              ])
        ]);
      },
    ));

    Directory output = await getApplicationDocumentsDirectory();
    final bcareport = File("${output.path}/BCAReport.pdf");
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
