import 'package:flutter/material.dart';
import './data/questions-data.dart';
import './questions-view.dart';
import './quiz-result.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    var appState = new _MyAppState();
    return appState;
  }
}

class _MyAppState extends State<MyApp> {
  final Map<int, int> _clickedAnswers = new Map();
  int _questonIndex = 0;
  Function _answerQuestion(int answerIndex) {
    if (_questonIndex < questionsData.length) {
      _clickedAnswers.addEntries([MapEntry(_questonIndex, answerIndex)]);
    }
    return () => setState(
          () {
            if (_questonIndex < questionsData.length) {
              _questonIndex = _questonIndex + 1;
              print('Answer ' + answerIndex.toString() + ' chosen!');
            }
          },
        );
  }

  void _resetQuestions() {
    setState(() {
      _questonIndex = 0;
      _clickedAnswers.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    print('(re)build widget');
    final parsedQuestions = parseToQuestionData(questionsData);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: _questonIndex < questionsData.length
                ? questionView(
                    parsedQuestions.elementAt(_questonIndex), _answerQuestion)
                : [
                    QuizResult(
                      _clickedAnswers.map(
                        (key, value) => MapEntry(
                          parsedQuestions.elementAt(key).question,
                          parsedQuestions
                              .elementAt(key)
                              .answers
                              .elementAt(value),
                        ),
                      ),
                      _resetQuestions,
                    )
                  ],
          ),
        ),
      ),
    );
  }
}
