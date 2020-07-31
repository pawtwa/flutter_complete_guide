import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String _questionText;

  Question(this._questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 35),
      child: Text(
        _questionText,
        style: TextStyle(fontSize: 28, color: Colors.blue),
        textAlign: TextAlign.center,
      ),
    );
  }
}
