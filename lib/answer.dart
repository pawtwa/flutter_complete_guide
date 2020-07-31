import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function _onPressedCallback;
  final String _btnText;
  final Color _btnColor;

  Answer(this._btnText, this._onPressedCallback, this._btnColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 35, vertical: 5),
      child: RaisedButton(
        color: _btnColor,
        onPressed: _onPressedCallback,
        child: Text(_btnText),
      ),
    );
  }
}
