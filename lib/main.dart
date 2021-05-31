import 'package:flutter/material.dart';
import 'car.dart';
import 'MyApp.dart';
import 'MyApp2.dart';

void main() {
  // runApp(MyApp(name: 'Orange', age: 16));   // myApp 1
  runApp(MyApp2());     // myApp 2
}

//-------------------------- bai 1---------------------------------

// var car = Car(name: "tomato", year: 1995);
// car.doSomthing(envent: "khoanh khac");
// car.handleEvent = () {
//   print("ssssssssssssss");
// };

/*List<Car> cars = <Car>[];
  cars.add(Car(name: "orange", year: 1995));
  cars.add(Car(name: "tomato", year: 1998));
  cars.add(Car(name: "apple", year: 1997));

  cars.sort((car1, car2) => car1.year - car2.year);
  cars.sort((car1, car2) => car1.name.compareTo(car2.name));
  var filterCar = cars
      .where((element) => element.year == 1995 && element.name.contains("ora"))
      .toList();

  var mapCar = cars
      .map((e) => e.name).toList();

  cars.forEach((element) {
    print(element);
  });

  filterCar.forEach((element) {
    print(element);
  });


  mapCar.forEach((element) {
    print(element);
  });

  runApp(Center(
    child: Text(
      "orange",
      style: TextStyle(fontSize: 30),
      textDirection: TextDirection.ltr,
    ),
  ));*/

//---------------------------------------------------------------------
