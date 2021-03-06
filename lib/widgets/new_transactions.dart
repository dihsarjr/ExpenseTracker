import 'package:flutter/material.dart';

class NewTransactions extends StatefulWidget {
  final Function newHandler;
  NewTransactions(this.newHandler);

  @override
  _NewTransactionsState createState() => _NewTransactionsState();
}

class _NewTransactionsState extends State<NewTransactions> {
  final titleControl = TextEditingController();

  final amountControl = TextEditingController();

  void submitFunction() {
    final titleEntered = titleControl.text;
    final amountEntered = double.parse(amountControl.text);

    if (titleEntered.isEmpty || amountEntered < 0) {
      return;
    }

    widget.newHandler(
      titleEntered,
      amountEntered,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5),
              child: Card(
                child: TextField(
                  decoration: InputDecoration(labelText: ' Title'),
                  controller: titleControl,
                  onSubmitted: (_) => submitFunction(),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Card(
                child: TextField(
                  decoration: InputDecoration(labelText: ' Amount'),
                  controller: amountControl,
                  keyboardType: TextInputType.number,
                  onSubmitted: (_) => submitFunction(),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Card(
                color: Colors.lightBlue,
                child: FlatButton(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'ADD',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  onPressed: submitFunction,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
