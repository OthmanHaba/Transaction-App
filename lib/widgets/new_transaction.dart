import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titalController = TextEditingController();

  final amountController = TextEditingController();

  void sumpitData() {
    final enterdTitle = titalController.text;
    final enterdAmount = double.parse(amountController.text);
    if (enterdTitle.isEmpty || enterdAmount <= 0) {
      return;
    }
    widget.addTx(
      enterdTitle,
      enterdAmount,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Tital'),
              controller: titalController,
              onSubmitted: (_) => sumpitData(),
              //  onChanged: (value) => titalInput = value,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => sumpitData(),
              //  onChanged: (val) {
              //  amountInput = val;
              // },
            ),
            TextButton(
              child: Text('Add transaction'),
              onPressed: sumpitData,
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
            )
          ],
        ),
      ),
    );
  }
}
