

import 'package:customersatisfactionform/question.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          title: Text("Feedback"),
        ),
        floatingActionButton: new FloatingActionButton(
            elevation: 18.0,
            child: new Icon(Icons.navigate_next),
            backgroundColor: new Color(0xFFE57373),
            onPressed: () {
              currentPage++;
              _pageController.jumpToPage(currentPage);
            }),
        body: Column(
          children: <Widget>[

            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  currentPage = index;
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


}
