import 'package:flutter/material.dart';

class QuestionData {
  final String question;
  final List<AnswerData> answers;

  QuestionData(this.question, this.answers);
}

class AnswerData {
  final String answer;
  final Color color;

  AnswerData(this.answer, this.color);
}

const List<Map<String, Object>> questionsData = [
  {
    'question': 'What\'s your favourite color?',
    'answers': [
      {
        'answer': 'Red',
        'color': Colors.red,
      },
      {
        'answer': 'Green',
        'color': Colors.green,
      },
      {
        'answer': 'Blue',
        'color': Colors.blue,
      },
    ]
  },
  {
    'question': 'What\'s your favourite animal?',
    'answers': [
      {
        'answer': 'Giraffe',
        'color': Colors.orange,
      },
      {
        'answer': 'Frog',
        'color': Colors.green,
      },
      {
        'answer': 'Bear',
        'color': Colors.brown,
      },
    ]
  },
  {
    'question': 'Who\'s your favourite instructor?',
    'answers': [
      {
        'answer': 'Max',
        'color': Colors.tealAccent,
      },
      {
        'answer': 'Max',
        'color': Colors.tealAccent,
      },
      {
        'answer': 'Max',
        'color': Colors.tealAccent,
      },
    ]
  },
];

List<QuestionData> _parsed;

List<QuestionData> parseToQuestionData(
    List<Map<String, Object>> questionsData) {
  if (_parsed == null && questionsData != null) {
    _parsed = [];
    questionsData.forEach((element) {
      final String questionString = element.entries
          .where((element) => element.key == 'question')
          .first
          .value as String;
      final answerMaps = element.entries
          .where((element) => element.key == 'answers')
          .first
          .value as List<Map<String, Object>>;
      final answers = answerMaps
          .map((e) => AnswerData(
                e.entries
                    .where((element) => element.key == 'answer')
                    .first
                    .value,
                e.entries
                    .where((element) => element.key == 'color')
                    .first
                    .value,
              ))
          .toList();
      final questionData = QuestionData(
        questionString,
        answers,
      );
      _parsed.add(questionData);
    });
  }
  return _parsed;
}
