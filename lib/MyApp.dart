import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


// StatefulWidget
class MyApp extends StatefulWidget {
  String name;
  int age;

  MyApp({required this.name, required this.age});

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  String _email = ''; // this is state
  final emailEdit = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addObserver(this); // đăng ký observer
    print('inti state');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailEdit.dispose();
    WidgetsBinding.instance!.removeObserver(this); // đăng ký observer
    print("dispose");
  }

  // phương thức kiểm tra widget có nằm trng backgounrd ko

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      print('this is backgound');
    } else if (state == AppLifecycleState.resumed) {
      print('this thi foregound');
    }
  }

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.now(); // date time
    return MaterialApp(
      title: "my app",
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextField(
                  controller: emailEdit,
                  onChanged: (text) {
                    this.setState(() {
                      _email =
                          text; // moi lan thay đổi state thì gọi lại vào hàm này
                    });
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                              const Radius.circular(10))),
                      labelText: 'enter number'),
                ),
              ),
              Text(
                'name: ${widget.name} - age: ${widget.age} ',
                style: TextStyle(fontSize: 30, color: Colors.red),
              ),
              Text(
                _email,
                style: TextStyle(fontSize: 30, color: Colors.green),
              ),
              Text(
                // sử dụng thư viện
                
                dateTime.toString(),
                style: TextStyle(fontSize: 30, color: Colors.green),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
// StatelessWidget
class MyApp extends StatelessWidget {
  String name;

  int age;

  MyApp({required this.name, required this.age});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "this my app",
        home: Scaffold(
          body: Center(
            child: Text(
              "name : $name - age : $age",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.red),
              textDirection: TextDirection.ltr,
            ),
          ),
        ));
  }
}*/
