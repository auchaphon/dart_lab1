import 'package:flutter/material.dart';
import './widgets/question.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var questionIndex = 0;
  var message = "";
  var question = [
    {
      "title": 'Who is your daddy?',
      "answer": [
        {"title": "Justin bieber", "id": 1},
        {"title": "Bruno", "id": 2},
        {"title": "Micheal jackson", "id": 3}
      ],
      "answerPoint": 1
    },
    {
      "title": 'Who is your mom?',
      "answer": [
        {"title": "Brinie", "id": 1},
        {"title": "Mickey mouse", "id": 2},
        {"title": "Taylor swift", "id": 3}
      ],
      "answerPoint": 2
    },
  ];
  void _onPressAnswer(title, answer, answerPoint) {
    if (answer == answerPoint) {
      setState(() {
        message = "ถูกต้อง";
      });
    } else {
      setState(() {
        message = "ผิด";
      });
    }
    if (questionIndex != (question.length - 1)) {
      setState(() {
        questionIndex = questionIndex + 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text('Header My App')),
            body: Column(
              children: <Widget>[
                Question(question[questionIndex]["title"]),
                Row(
                  children: <Widget>[
                    for (var item in question[questionIndex]["answer"])
                      Container(
                        child: RaisedButton(
                          onPressed: () => _onPressAnswer(
                              item["title"],
                              item["id"],
                              question[questionIndex]["answerPoint"]),
                          child: Text(item["title"]),
                        ),
                        margin: EdgeInsets.only(left: 10),
                      )
                  ],
                ),
                Row(children: <Widget>[
                  (message == "ถูกต้อง")
                      ? Text(message, style: TextStyle(color: Colors.green))
                      : Text(message, style: TextStyle(color: Colors.red))
                ])
              ],
            )),
        theme: ThemeData(
          primaryColor: Colors.lightBlue[500],
          accentColor: Colors.cyan[600],
        ));
  }
}
