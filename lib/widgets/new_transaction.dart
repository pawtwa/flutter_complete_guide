import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function _addNewTransaction;

  NewTransaction(this._addNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  // String titleInput;
  // String amountInput;
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _date = DateTime.now();

  final _titleFocusNode = new FocusNode();
  final _amountFocusNode = new FocusNode();

  void _submit() {
    try {
      final title = _titleController.text;
      final amount = double.parse(_amountController.text);

      if (title.isEmpty || amount < 0 || _date == null) {
        return;
      }

      widget._addNewTransaction(title, amount, _date);
      _titleController.clear();
      _amountController.clear();
      Navigator.of(context).pop();
    } catch (error) {}
  }

  void _presentDatePicker() {
    DateTime now = DateTime.now();
    showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now.subtract(Duration(days: 366)),
      lastDate: now,
    ).then((value) =>
        setState(() => _date = DateTime.tryParse(value.toIso8601String())));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              autofocus: true,
              focusNode: _titleFocusNode,
              decoration: InputDecoration(labelText: 'Title'),
              controller: _titleController,
              onSubmitted: (_) {
                FocusScope.of(context).requestFocus(_amountFocusNode);
              },
            ),
            TextField(
              focusNode: _amountFocusNode,
              decoration: InputDecoration(labelText: 'Amount'),
              controller: _amountController,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
              ],
              keyboardType: TextInputType.number,
              onSubmitted: (_) {
                _presentDatePicker();
              },
            ),
            Container(
              height: 80,
              child: Row(
                children: [
                  Text(
                    _date != null
                        ? DateFormat.yMEd().format(_date)
                        : 'No Date Chosen!',
                  ),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    onPressed: _presentDatePicker,
                    child: Text(
                      'Choose Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            RaisedButton(
              child: Text(
                'Add',
              ),
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).textTheme.button.color,
              onPressed: _submit,
            )
          ],
        ),
      ),
    );
  }
}

// class NewTransaction extends StatefulWidget {
//   @override
//   _NewTransactionState createState() => _NewTransactionState();
// }

// class _NewTransactionState extends State<NewTransaction> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
