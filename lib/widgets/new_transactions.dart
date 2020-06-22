import 'package:flutter/material.dart';

class NewTransactions extends StatelessWidget {
  final Function newHandler;
  NewTransactions(this.newHandler);

  final titleControl = TextEditingController();
  final amountControl = TextEditingController();

  //onPress
  void submitFunction() {
    final titleEntered = titleControl.text;
    final amountEntered = double.parse(amountControl.text);

    if (titleEntered.isEmpty || amountEntered < 0) {
      return;
    }

    newHandler(
      titleEntered,
      amountEntered,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleControl,
              onSubmitted: (_) => submitFunction(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountControl,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitFunction(),
            ),
            Card(
              color: Colors.purple,
              child: FlatButton(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text('ADD'),
                ),
                onPressed: submitFunction,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
