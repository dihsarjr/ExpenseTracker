import 'package:expensetracker/model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;
  Chart(this.recentTransaction);
  List<Map<String, Object>> get groupedTransactionValue {
    return List.generate(7, (index) {
      final weekDAy = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalSum = 0.0;
      for (var i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].date.day == weekDAy.day &&
            recentTransaction[i].date.month == weekDAy.month &&
            recentTransaction[i].date.year == weekDAy.year) {
          totalSum += recentTransaction[1].amount;
        }
      }

      print(totalSum);
      return {'day': DateFormat.E().format(weekDAy), "amount": totalSum};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[],
      ),
    );
  }
}
