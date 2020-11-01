
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:sprintf/sprintf.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:customersatisfactionform/globals.dart' as globals;
class QuestionPage extends StatefulWidget {

  int index;
  QuestionPage({Key key, this.index}) : super(key: key);

  @override
  QuestionPageState createState() => QuestionPageState();
}

class QuestionPageState extends State<QuestionPage> {

  TextEditingController _remark = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body:  Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Expanded(
                      child: Text(
                        getQuestion(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: ScreenUtil().setWidth(40),
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  ]
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  children : [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                      child: Text(
                        "Legend",
                      ),
                    ),
                    Text(
                      "1/2 : Very Dissatisfied",
                    ),
                    Text(
                      "3/4 : Dissatisfied",
                    ),
                    Text(
                      "5/6 :  Neutral",
                    ),
                    Text(
                      "7/8 : Satisfied",
                    ),
                    Text(
                      "9/10 : Very Satisfied",
                    ),
                  ]
                ),
              ),
            SmoothStarRating(
              rating: getRating(),
              isReadOnly: false,
              size: ScreenUtil().setWidth(60),
              filledIconData: Icons.star,
              halfFilledIconData: Icons.star_half,
              defaultIconData: Icons.star_border,
              starCount: 10,
              allowHalfRating: false,
              spacing: 2.0,
              onRated: (value) {
                setRating(value);
              },
            ),
              Visibility(
                visible: false,
                child: TextField(
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
                      labelText: 'please enter remark if any',
                    ),
                    onChanged: (text) {
                      setRemark(text);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getQuestion(){
    switch(widget.index){
      case 0 :
        return globals.Q1;
      case 1 :
        return globals.Q2;
      case 2 :
        return globals.Q3;
      case 3 :
        return globals.Q4;
      case 4 :
        return globals.Q5;
      case 5 :
        return globals.Q6;
      case 6 :
        return globals.Q7;
      case 7 :
        return globals.Q8;
      case 8 :
        return globals.Q9;
      case 9 :
        return globals.Q10;

    }
  }

  getRating(){
    switch(widget.index){
      case 0 :
        return globals.Q1rating;
      case 1 :
        return globals.Q2rating;
      case 2 :
        return globals.Q3rating;
      case 3 :
        return globals.Q4rating;
      case 4 :
        return globals.Q5rating;
      case 5 :
        return globals.Q6rating;
      case 6 :
        return globals.Q7rating;
      case 7 :
        return globals.Q8rating;
      case 8 :
        return globals.Q9rating;
      case 9 :
        return globals.Q10rating;

    }
  }

  setRating(double rating){
    switch(widget.index){
      case 0 :
        globals.Q1rating = rating;
        break;
      case 1 :
        globals.Q2rating = rating;
        break;
      case 2 :
        globals.Q3rating = rating;
        break;
      case 3 :
        globals.Q4rating = rating;
        break;
      case 4 :
        globals.Q5rating = rating;
        break;
      case 5 :
        globals.Q6rating = rating;
        break;
      case 6 :
        globals.Q7rating = rating;
        break;
      case 7 :
        globals.Q8rating = rating;
        break;
      case 8 :
        globals.Q9rating = rating;
        break;
      case 9 :
        globals.Q10rating = rating;
        break;

    }
  }

  setRemark(String remark){
//    switch(widget.index){
//      case 0 :
//        globals.Q1remark = remark;
//        break;
//      case 1 :
//        globals.Q2remark = remark;
//        break;
//      case 2 :
//        globals.Q3remark = remark;
//        break;
//      case 3 :
//        globals.Q4remark = remark;
//        break;
//      case 4 :
//        globals.Q5remark = remark;
//        break;
//      case 5 :
//        globals.Q6remark = remark;
//        break;
//      case 6 :
//        globals.Q7remark = remark;
//        break;
//      case 7 :
//        globals.Q8remark = remark;
//        break;
//      case 8 :
//        globals.Q9remark = remark;
//        break;
//      case 9 :
//        globals.Q10remark = remark;
//        break;
//
//    }
  }

}