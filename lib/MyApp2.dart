import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'transaction.dart';
import 'transactionlist.dart';

// StatefulWidget
class MyApp2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp2> with WidgetsBindingObserver {
  final GlobalKey<ScaffoldState> _scaffllodKey = new GlobalKey<ScaffoldState>();
  final _contentController = TextEditingController();
  final _amountController = TextEditingController();

  // state
  Transaction _transaction = Transaction(context: '', amount: 0.0,date: DateTime.now());
  List<Transaction> _listTransaction = [];
  Transaction transaction11 = Transaction(context: 'rrrrr', amount: 0.0, date: DateTime.now());

  void _insertTransaction() {
    if (!_transaction.context.isEmpty) {
      _transaction.date = DateTime.now();
      _listTransaction.add(_transaction);
      transaction11 = _transaction;
      _transaction = Transaction(context: '', amount: 0.0, date: DateTime.now());
      _contentController.text = '';
      _amountController.text = '';
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this); // đăng ký observer
    print('inti state');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    WidgetsBinding.instance!.removeObserver(this); // đăng ký observer
    print("dispose");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "my app",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("orange"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                print("on click");
                setState(() {
                  this._insertTransaction();
                });
              },
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: 'add',
          child: Icon(Icons.add),
          onPressed: () {
            print("on click");
            setState(() {
              this._insertTransaction();
            });
          },
        ),
        key: _scaffllodKey,
        body: SafeArea(
            minimum: const EdgeInsets.only(left: 20, right: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    transaction11.context,
                    style: TextStyle(fontSize: 30, color: Colors.red),
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Contexet'),
                    controller: _contentController,
                    onChanged: (text) {
                      setState(() {
                        _transaction.context = text;
                      });
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Amount'),
                    controller: _amountController,
                    onChanged: (text) {
                      setState(() {
                        _transaction.amount = double.tryParse(text) ??
                            0; // nếu lỗi thì lấy gtri 0
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                  ButtonTheme(
                    height: 60,
                    child: FlatButton(
                      child: Text(
                        'Insert trancition',
                        style: const TextStyle(fontSize: 18),
                      ),
                      color: Colors.pink,
                      textColor: Colors.white,
                      onPressed: () {
                        setState(() {
                          this._insertTransaction();
                        });

                        _scaffllodKey.currentState!.showSnackBar(
                          SnackBar(
                              content: Text(_transaction.toString()),
                              duration: Duration(
                                seconds: 3,
                              )),
                        );
                      },
                    ),
                  ),
                  TransaciontList(listTransaction: _listTransaction)
                ],
              ),
            )),
      ),
    );
  }
}
