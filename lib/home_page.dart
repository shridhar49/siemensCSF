import 'package:customersatisfactionform/globals.dart' as globals;
import 'package:customersatisfactionform/questions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController _clientNameController = new TextEditingController();
  TextEditingController _projectName = new TextEditingController();
  TextEditingController _typeOfProduct = new TextEditingController();

//  String clientName = "";
//  String projectName = "";
//  String typeOfProduct = "";
//  var dateOfFeedback = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _clientNameController.text = globals.client;
      _projectName.text = globals.projectName;
      _typeOfProduct.text = globals.typeOfProduct;
    });
  }
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text("CSF"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              onChanged: (text) {
                globals.client = text;
              },
              controller: _clientNameController,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
              decoration: InputDecoration(
                alignLabelWithHint: true,
                labelText: 'Client : ',
              ),
            ),
            TextField(
              onChanged: (text) {
                globals.projectName = text;
              },
              controller: _projectName,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
              decoration: InputDecoration(
                alignLabelWithHint: true,
                labelText: 'Project Name : ',
              ),
            ),
            TextField(
              onChanged: (text) {
                globals.typeOfProduct = text;
              },
              controller: _typeOfProduct,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
              decoration: InputDecoration(
                alignLabelWithHint: true,
                labelText: 'Type Of Product : ',
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Date : ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25),
                  ),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CupertinoTheme(
                data: CupertinoThemeData(
                  textTheme: CupertinoTextThemeData(
                    dateTimePickerTextStyle: TextStyle(
                        fontSize: 25,color: Colors.deepPurple),
                  ),
                ),
                child: SizedBox(
                  height: 125,
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    maximumDate: DateTime.now().add(Duration(hours: 1)),
                    initialDateTime: DateTime.fromMillisecondsSinceEpoch(globals.dateOfFeedback.toInt()),
                    onDateTimeChanged: (DateTime newDateTime) {
                      // Do something
                      globals.dateOfFeedback =
                      (newDateTime.millisecondsSinceEpoch);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

          if (_clientNameController.text.length == 0)
            Fluttertoast.showToast(
                msg: "Please enter client name",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          else if (_projectName.text.length == 0)
            Fluttertoast.showToast(
                msg: "Please enter project name",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          else if (_typeOfProduct.text.length == 0)
            Fluttertoast.showToast(
                msg: "Please enter type of product",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          else {

            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => QuestionsPage()));

          }


        },
        child: Icon(Icons.navigate_next),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
