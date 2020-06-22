import 'package:flutter/material.dart';

class NewTransactions extends StatelessWidget {
  final Function newHandler;
  NewTransactions(this.newHandler);

  final titleControl = TextEditingController();
  final amountControl = TextEditingController();
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
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountControl,
            ),
            Card(
              color: Colors.purple,
              child: FlatButton(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text('ADD'),
                ),
                onPressed: () {
                  newHandler(
                    titleControl.text,
                    double.parse(amountControl.text),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
