
import 'package:open_file/open_file.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:customersatisfactionform/question.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:sprintf/sprintf.dart';
import 'package:customersatisfactionform/globals.dart' as globals;
import 'package:pdf/widgets.dart' as pw;
class QuestionsPage extends StatefulWidget {
  @override
  QuestionsPageState createState() => QuestionsPageState();
}

class QuestionsPageState extends State<QuestionsPage> {
  PageController _pageController;
  int currentPage = 0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text( sprintf("Feedback %d/10",[currentPage+1])),
        ),
        floatingActionButton: new FloatingActionButton(
            elevation: 18.0,
            child: new Icon(Icons.navigate_next),
            backgroundColor: new Color(0xFFE57373),
            onPressed: () {
              if(currentPage < 9){
                setState(() {
                  currentPage++;
                });
                _pageController.jumpToPage(currentPage);
              }else{
                generatePDF();
//                Navigator.of(context)
//                    .push(MaterialPageRoute(builder: (_) => QuestionsPage()));
              }

            }),
        body: Column(
          children: <Widget>[

            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                children: <Widget>[
                  QuestionPage(index : 0),
                  QuestionPage(index : 1),
                  QuestionPage(index : 2),
                  QuestionPage(index : 3),
                  QuestionPage(index : 4),
                  QuestionPage(index : 5),
                  QuestionPage(index : 6),
                  QuestionPage(index : 7),
                  QuestionPage(index : 8),
                  QuestionPage(index : 9),
                ],
              ),
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
    salidas.add(<String>['Title1','Title2','Title n']);

    for(var indice=0;indice<5;indice++) {
      List<String> recind = <String>[
        "1",
        "Pune",
        "411024"
      ];
      salidas.add(recind);
    }

    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build : (pw.Context context)  {
          return pw.Column(
            children: [pw.Column(
              mainAxisAlignment: pw.MainAxisAlignment.center,
              crossAxisAlignment: pw.CrossAxisAlignment.center,
              children:[
                pw.SizedBox(
                  height: 80,
                  child: pw.Image(siemens_energy),
                ),
                pw.Padding(
                    padding: pw.EdgeInsets.only(top: 5, bottom: 8),
                    child: pw.FittedBox(
                        fit: pw.BoxFit.scaleDown,
                        child: pw.SizedBox(
                          child: pw.Text(
                            "Measurement of Customer Satisfaction",
                            softWrap: true,
                            textAlign: pw.TextAlign.center,
                            style: pw.TextStyle(
                              color: PdfColors.deepPurpleAccent,
                              fontSize: 28,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                        ))),
                pw.Table.fromTextArray(context: context,data: salidas),
              ]
            )]
          );
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
