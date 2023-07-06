import 'package:flutter/material.dart';

void main() {
  runApp(const FlutterApp());
}

class FlutterApp extends StatelessWidget {
  const FlutterApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FlutterApp",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const DashBoardScreen(),
    );
  }
}

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  var no1Controller = TextEditingController();
  var no2Controller = TextEditingController();

  int result = 0;

  void addNumbers() {
    setState(() {
      int num1 = int.parse(no1Controller.text);
      int num2 = int.parse(no2Controller.text);
      result = num1 + num2;
    });
  }

  void subtractNumbers() {
    setState(() {
      int num1 = int.parse(no1Controller.text);
      int num2 = int.parse(no2Controller.text);
      result = num1 - num2;
    });
  }

  void multiplyNumbers() {
    setState(() {
      int num1 = int.parse(no1Controller.text);
      int num2 = int.parse(no2Controller.text);
      result = num1 * num2;
    });
  }

  void divideNumbers() {
    setState(() {
      int num1 = int.parse(no1Controller.text);
      int num2 = int.parse(no2Controller.text);
      result = num1 ~/ num2; // Use integer division to get an integer result
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Calculations'),
      ),
      body: Container(
        color: Colors.blue.shade100,
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: no1Controller,
              ),
              TextField(
                controller: no2Controller,
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: addNumbers,
                    child: const Text('Add'),
                  ),
                  ElevatedButton(
                    onPressed: subtractNumbers,
                    child: const Text('Sub'),
                  ),
                  ElevatedButton(
                    onPressed: multiplyNumbers,
                    child: const Text('Mult'),
                  ),
                  ElevatedButton(
                    onPressed: divideNumbers,
                    child: const Text('Div'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'Result: $result',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
