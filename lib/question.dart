
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body:  Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                getQuestion(),
                textAlign: TextAlign.center,

              ),
            SmoothStarRating(
              rating: getRating(),
              isReadOnly: false,
              size: 30,
              filledIconData: Icons.star,
              halfFilledIconData: Icons.star_half,
              defaultIconData: Icons.star_border,
              starCount: 10,
              allowHalfRating: true,
              spacing: 2.0,
              onRated: (value) {
                setRating(value);
              },
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

}