import 'package:flutter/cupertino.dart';
import 'transaction.dart';
import 'package:flutter/material.dart';

class TransaciontList extends StatelessWidget {
  List<Transaction> listTransaction = [];

  TransaciontList({required this.listTransaction});

  ListView _buildListView() {
    return ListView.builder(
        itemCount: listTransaction.length,
        itemBuilder: (context, index) {
          return Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: (index - 1) % 2 == 0 ? Colors.amber : Colors.green,
              elevation: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.all(10)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(top: 10)),
                      Text(
                        listTransaction[index].context,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        'date :  ${listTransaction[index].date.toString()}',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 10)),
                    ],
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        child: Text('${listTransaction[index].amount}\$',
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(color: Colors.white)),
                      ),
                    ],
                  )),
                ],
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: this._buildListView(),
    );
  }
}
