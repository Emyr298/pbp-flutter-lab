import 'package:flutter/material.dart';
import 'package:counter_7/drawer.dart';
import 'package:counter_7/models/budget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Budget> budgetList = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter 7',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(budgetList: budgetList),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.budgetList});

  final String title = 'Program Counter';
  final List<Budget> budgetList;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: MyDrawer(budgetList: widget.budgetList),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              (_counter % 2 == 0) ? 'GENAP' : 'GANJIL',
              style: TextStyle(
                color: (_counter % 2 == 0) ? Colors.red : Colors.blue,
              ),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Visibility(
              visible: (_counter != 0),
              child: FloatingActionButton(
                heroTag: 'buttonDecrement',
                onPressed: _decrementCounter,
                tooltip: 'Decrement',
                child: const Icon(Icons.remove),
              ),
            ),
            FloatingActionButton(
              heroTag: 'buttonIncrement',
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
