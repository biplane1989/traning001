import 'package:meta/meta.dart';

class Transaction {
  String context;
  double amount;
  DateTime date;

  Transaction({required this.context, required this.amount, required this.date});

  @override
  String toString() {
    // TODO: implement toString
    return "context: $context - amount: $amount";
  }
}
