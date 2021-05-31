import 'package:flutter/material.dart';

class Car {
  String name;
  int year;

  Car({required this.name, this.year = 1989});

  @override
  String toString() {
    return '${this.name} - ${this.year}';
  }

  void doSomthing({required String envent}) {
    print('do some thing $envent');
    this.handleEvent;
  }

  Function handleEvent = () {};
}
