import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  int questonIndex = 0;

  @override
  Widget build(BuildContext context) {
    var questions = [
      'What\'s your favourite color?',
      'What\'s your favourite animal?'
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: Column(
          children: [
            Text(questions.elementAt(questonIndex)),
            RaisedButton(
              onPressed: () => print('Answer 1 chosen!'),
              child: Text('Red'),
            ),
            RaisedButton(
              onPressed: () => print('Answer 2 chosen!'),
              child: Text('Green'),
            ),
            RaisedButton(
              onPressed: () => print('Answer 3 chosen!'),
              child: Text('Blue'),
            ),
          ],
        ),
      ),
    );
  }
}
