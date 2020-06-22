import 'package:expensetracker/widgets/new_transactions.dart';
import 'package:expensetracker/widgets/transaction_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'model/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
  void _newAdNewTransaction(String txTitle, double txAmount) {
    final _newTx = Transaction(
      id: DateTime.now().toString(),
      amount: txAmount,
      title: txTitle,
      date: DateTime.now(),
    );
    setState(() {
      transaction.add(_newTx);
    });
  }

  void startNewTX(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransactions(_newAdNewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Expense Tracker',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () => startNewTX(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              width: double.infinity,
              color: Colors.red,
              child: Card(
                color: Colors.red,
                child: Text('chart place'),
              ),
            ),
            TransactionList(transaction),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.add),
        onPressed: () => startNewTX(context),
      ),
    );
  }
}
