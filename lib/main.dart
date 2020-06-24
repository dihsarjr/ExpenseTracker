import 'package:expensetracker/widgets/chart.dart';
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
      theme: ThemeData(
          primarySwatch: Colors.lightBlue, fontFamily: 'Baumans-Regular'),
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
//    Transaction(
//      id: 't1',
//      amount: 32.20,
//      title: 'NEW MOBILE',
//      date: DateTime.now(),
//    ),
//    Transaction(
//      id: 't2',
//      amount: 40.20,
//      title: 'NEW CAR',
//      date: DateTime.now(),
//    ),
//    Transaction(
//      id: 't3',
//      amount: 20.20,
//      title: 'NEW BIKE',
//      date: DateTime.now(),
//    ),
//    Transaction(
//      id: 't4',
//      amount: 10.20,
//      title: 'NEW LAPTOP',
//      date: DateTime.now(),
//    ),
//    Transaction(
//      id: 't5',
//      amount: 10.20,
//      title: 'NEW lock',
//      date: DateTime.now(),
//    ),
  ];
  List<Transaction> get _recentTransaction {
    return transaction.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(Duration(days: 7)),
      );
    }).toList();
  }

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
        title: Text(
          'Expense Tracker',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
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
        child: transaction.isEmpty
            ? Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 50, 20, 0),
                    child: Center(
                      child: Text(
                        'TRANSACTION IS EMPTY',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.add_circle,
                      color: Colors.lightBlue,
                    ),
                    iconSize: 70,
                    onPressed: () => startNewTX(context),
                  ),
                  Text(
                    'ADD TRANSACTION',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              )
            : Column(
                children: <Widget>[
                  Chart(_recentTransaction),
                  TransactionList(transaction),
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () => startNewTX(context),
      ),
    );
  }
}
