import 'package:flutter/material.dart';
import './data/questions-data.dart';
import './question.dart';
import './answer.dart';

List<Widget> questionView(QuestionData questionData, Function callback) {
  final view = [
    Question(questionData.question),
    ...questionData.answers
        .asMap()
        .entries
        .map((e) => Answer(e.value.answer, callback(e.key), e.value.color))
        .toList(),
  ];
  return view;
}
