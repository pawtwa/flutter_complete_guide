import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/answer.dart';
import 'package:flutter_complete_guide/data/questions-data.dart';
import 'package:flutter_complete_guide/question.dart';

class QuizResult extends StatelessWidget {
  final Map<String, AnswerData> result;
  final Function resetAction;

  QuizResult(this.result, this.resetAction);

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[
      Container(
        child: Column(
          children: <Widget>[
            Text(
              'RESULTS',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                // fontStyle: FontStyle.italic,
                fontSize: 36,
              ),
            ),
            Divider(),
          ],
        ),
      )
    ];
    if (result != null) {
      result.forEach((question, answerData) {
        children.add(Container(
          child: Column(
            children: <Widget>[
              Question(question),
              Answer(answerData.answer, () {}, answerData.color),
            ],
          ),
        ));
      });
    }
    if (resetAction != null) {
      children.add(Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 35),
        child: Column(
          children: <Widget>[
            Divider(),
            RaisedButton(
              color: Colors.red,
              onPressed: resetAction,
              child: Text('Resetuj'),
            ),
          ],
        ),
      ));
    }
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 35),
      child: Column(
        children: [...children.toList()],
      ),
    );
  }
}
