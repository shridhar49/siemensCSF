import 'package:customersatisfactionform/review_and_submit.dart';
import 'package:customersatisfactionform/signature_and_remark.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
          title: Text(sprintf("Feedback %d/10", [currentPage + 1])),
        ),
        floatingActionButton: new FloatingActionButton(
            elevation: 18.0,
            child: new Icon(Icons.navigate_next),
            backgroundColor: new Color(0xFFE57373),
            onPressed: () {

              if ((currentPage == 0 && globals.Q1rating == 0) ||
                  (currentPage == 1 && globals.Q2rating == 0) ||
                  (currentPage == 2 && globals.Q3rating == 0) ||
                  (currentPage == 3 && globals.Q4rating == 0) ||
                  (currentPage == 4 && globals.Q5rating == 0) ||
                  (currentPage == 5 && globals.Q6rating == 0) ||
                  (currentPage == 6 && globals.Q7rating == 0) ||
                  (currentPage == 7 && globals.Q8rating == 0) ||
                  (currentPage == 8 && globals.Q9rating == 0) ||
                  (currentPage == 9 && globals.Q10rating == 0)) {
                Fluttertoast.showToast(
                    msg: "Please submit the rating",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
              } else  {
                if (currentPage < 9) {
                  setState(() {
                    currentPage++;
                  });
                  _pageController.jumpToPage(currentPage);
                }else {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => signature_and_remark()),
                          (Route<dynamic> route) => false);
                }

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
                  QuestionPage(index: 0),
                  QuestionPage(index: 1),
                  QuestionPage(index: 2),
                  QuestionPage(index: 3),
                  QuestionPage(index: 4),
                  QuestionPage(index: 5),
                  QuestionPage(index: 6),
                  QuestionPage(index: 7),
                  QuestionPage(index: 8),
                  QuestionPage(index: 9),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


}
