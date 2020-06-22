import 'package:expensetracker/model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatefulWidget {
  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
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
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
        children: transaction.map((tx) {
      return Card(
        color: Colors.purple,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: Text(
                '\$${tx.amount}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    tx.title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    DateFormat('yyyy-MM-dd').format(tx.date),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }).toList());
  }
}