import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  void _submit() {
    try {
      final title = _titleController.text;
      final amount = double.parse(_amountController.text);

      if (title.isEmpty || amount < 0) {
        return;
      }

      widget._addNewTransaction(title, amount);
      _titleController.clear();
      _amountController.clear();
      Navigator.of(context).pop();
    } catch (error) {}
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
              decoration: InputDecoration(labelText: 'Title'),
              // onChanged: (e) {
              //   titleInput = e;
              // },
              controller: _titleController,
              onSubmitted: (_) {
                // _amountController
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              // onChanged: (e) {
              //   amountInput = e;
              // },
              controller: _amountController,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
              ],
              keyboardType: TextInputType.number,
              onSubmitted: (_) {
                _submit();
              },
            ),
            FlatButton(
              child: Text('Add'),
              textColor: Theme.of(context).primaryColor,
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
