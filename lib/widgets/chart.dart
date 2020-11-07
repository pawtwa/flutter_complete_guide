import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/chart_bar.dart';
import 'package:intl/intl.dart';

import './../models/transaction.dart';

class ChartItem {
  final String day;
  final double amount;

  ChartItem({this.day, this.amount});
}

class Chart extends StatelessWidget {
  Chart(this.recentTransactions);

  final List<Transaction> recentTransactions;

  List<ChartItem> get _groupedTransactionValues {
    final dateNow = DateTime.now();
    return List.generate(7, (index) {
      final weekDay = dateNow.subtract(Duration(days: index));
      String totalSum = recentTransactions
          .where((element) =>
              element.date.day == weekDay.day &&
              element.date.month == weekDay.month &&
              element.date.year == weekDay.year)
          .map((element) => element.amount)
          .fold<double>(0, (value, element) => value + element)
          .toStringAsFixed(2);
      return ChartItem(
          day: DateFormat.E().format(weekDay) /*.substring(0, 2)*/,
          amount: double.parse(totalSum));
    }).reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    final chartData = _groupedTransactionValues;
    final amountTotal = chartData
        .fold<double>(
            0, (previousValue, element) => previousValue + element.amount)
        .toStringAsFixed(2);
    print('amountTotal');
    print(amountTotal);
    return Card(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 4),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: chartData
                  .map(
                    (e) => Expanded(
                      // fit: FlexFit.tight,
                      child:
                          ChartBar(e.day, e.amount, double.parse(amountTotal)),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
