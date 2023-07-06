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

  var result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Calculations'),
      ),
      body: Container(
        color: Colors.blue.shade100,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  keyboardType: TextInputType.number,
                  controller: no1Controller,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: no2Controller,
                ),
                Padding(
                  padding: const EdgeInsets.all(21.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                var no1 = int.parse(no1Controller.text.toString());
                var no2 = int.parse(no1Controller.text.toString());

                var sum = no1 + no2;

                result = "The sum of $no1 and $no2 is $sum";

                setState((){});
                },
                        child: const Text('Add'),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Sub'),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Mult'),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Div'),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding:  EdgeInsets.all(21.0),
                    child:  Text(result, style: TextStyle(fontSize: 25, color: Colors.white),),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
