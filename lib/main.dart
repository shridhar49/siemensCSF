import 'package:customersatisfactionform/questions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(FormPage());
}
class FormPage extends StatefulWidget {
  const FormPage({Key key}) : super(key: key);
  @override
  FormPageState createState() => FormPageState();
}

class FormPageState extends State<FormPage> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
//    ScreenUtil.init(context,
//        width: 1080, height: 2154, allowFontScaling: false);
    return MaterialApp(
      title: 'Customer Satisfaction Form',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Customer Satisfaction Form'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController _clientNameController = new TextEditingController();
  TextEditingController _projectName = new TextEditingController();
  TextEditingController _typeOfProduct = new TextEditingController();

  String clientName = "";
  String projectName = "";
  String typeOfProduct = "";
  var dateOfFeedback = 0.0;

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
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              onChanged: (text) {
                clientName = text;
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
                projectName = text;
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
                typeOfProduct = text;
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
                    maximumDate: DateTime.now(),
                    initialDateTime: DateTime.fromMillisecondsSinceEpoch(
                        DateTime.now().millisecondsSinceEpoch),
                    onDateTimeChanged: (DateTime newDateTime) {
                      // Do something
                      dateOfFeedback =
                      (newDateTime.millisecondsSinceEpoch.toDouble() /
                          1000);
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
         Navigator.of(context)
             .push(MaterialPageRoute(builder: (_) => QuestionsPage()));
       },
        child: Icon(Icons.navigate_next),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
