import 'package:flutter/material.dart';
import 'dart:math';

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
      theme: ThemeData(primarySwatch: Colors.amber),
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

  var result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scientific Calculator'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade200, Colors.blue.shade100],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView( // Wrap the Column with SingleChildScrollView
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: no1Controller,
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                    decoration: InputDecoration(
                      labelText: 'Enter number 1',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: no2Controller,
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                    decoration: InputDecoration(
                      labelText: 'Enter number 2',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CalculatorButton(
                        onPressed: () {
                          calculateResult((double no1, double no2) => no1 + no2, 'Add');
                        },
                        text: 'Add',
                      ),
                      CalculatorButton(
                        onPressed: () {
                          calculateResult((double no1, double no2) => no1 - no2, 'Subtract');
                        },
                        text: 'Subtract',
                      ),
                      CalculatorButton(
                        onPressed: () {
                          calculateResult((double no1, double no2) => no1 * no2, 'Multiply');
                        },
                        text: 'Multiply',
                      ),
                      CalculatorButton(
                        onPressed: () {
                          calculateResult(
                                (double no1, double no2) => no2 != 0 ? no1 / no2 : double.infinity,
                            'Divide',
                          );
                        },
                        text: 'Divide',
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CalculatorButton(
                        onPressed: () {
                          calculateResult((double no1, double _) => pow(no1, 2).toDouble(), 'Square');
                        },
                        text: 'Square',
                      ),
                      CalculatorButton(
                        onPressed: () {
                          calculateResult((double no1, double _) => pow(no1, 3).toDouble(), 'Cube');
                        },
                        text: 'Cube',
                      ),
                      CalculatorButton(
                        onPressed: () {
                          calculateResult((double no1, double no2) => no1 % no2, 'Remainder');
                        },
                        text: 'Remainder',
                      ),
                      CalculatorButton(
                        onPressed: () {
                          calculateResult((double no1, double no2) => pow(no1, no2).toDouble(), 'Power');
                        },
                        text: 'Power',
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      result,
                      style: const TextStyle(
                        fontSize: 25,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void calculateResult(double Function(double, double) operation, String operationName) {
    try {
      var no1 = double.parse(no1Controller.text);
      var no2 = double.parse(no2Controller.text);
      double resultValue = operation(no1, no2); // Cast the result to double explicitly
      setState(() {
        result = 'The $operationName of $no1 and $no2 is ${resultValue.toStringAsFixed(2)}';
      });
    } catch (e) {
      setState(() {
        result = 'Error: Please enter valid numbers';
      });
    }
  }
}

class CalculatorButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const CalculatorButton({
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Colors.blue,
        onPrimary: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Colors.blue, width: 2),
        ),
        elevation: 5,
        shadowColor: Colors.blue.shade200,
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}
