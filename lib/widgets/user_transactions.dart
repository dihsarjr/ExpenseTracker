import 'package:expensetracker/model/transaction.dart';
import 'package:expensetracker/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

import 'new_transactions.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> transaction = [
    Transaction(
      id: 't1',
      amount: 32.20,
      title: 'NEW MOBILE',
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      amount: 40.20,
      title: 'NEW CAR',
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      amount: 20.20,
      title: 'NEW BIKE',
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      amount: 10.20,
      title: 'NEW LAPTOP',
      date: DateTime.now(),
    ),
    Transaction(
      id: 't5',
      amount: 10.20,
      title: 'NEW lock',
      date: DateTime.now(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransactions(),
        TransactionList(transaction),
      ],
    );
  }
}
