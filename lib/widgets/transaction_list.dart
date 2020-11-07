import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:flutter_complete_guide/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final DateFormat dateFormatter = DateFormat.yMMMd(); // ('yyy-MM-dd');
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        transactions.isEmpty
            ? Center(
                child: Text('No transaction'),
              )
            : Container(
                // height: 50,
                child: ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Card(
                      // elevation: 5,
                      margin: EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 5,
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          child: Padding(
                            padding: EdgeInsets.all(6),
                            child: FittedBox(
                              child: Text('\$${transactions[index].amount}'),
                            ),
                          ),
                        ),
                        title: Text(
                          transactions[index].title,
                          style: Theme.of(context).textTheme.title,
                        ),
                        subtitle: Text(
                          DateFormat.yMMMd().format(transactions[index].date),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          color: Theme.of(context).errorColor,
                          onPressed: () {
                            deleteTransaction(transactions[index].id);
                          },
                        ),
                      ),
                    );
                  },
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: transactions.length,
                ),
              );

    /* transactions
              .map((transaction) => Card(
                    child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.stretch,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 3,
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(1)),
                                    border: Border.all(
                                        color: Theme.of(context).primaryColor,
                                        width: 2,
                                        style: BorderStyle.solid)),
                                margin: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 15),
                                padding: EdgeInsets.symmetric(
                                    vertical: 6, horizontal: 6),
                                child: Text(
                                  '\$ ${transaction.amount.toStringAsFixed(2)}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'OpenSans',
                                      color: Theme.of(context).primaryColor),
                                )),
                          ),
                          Expanded(
                            flex: 7,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    transaction.title,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    dateFormatter.format(transaction.date),
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Theme.of(context).disabledColor),
                                  ),
                                )
                              ],
                            ),
                          )
                        ]),
                  ))
              .toList(),*/
  }
}
