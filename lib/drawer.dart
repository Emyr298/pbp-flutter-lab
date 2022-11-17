import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/tambah_budget.dart';
import 'package:counter_7/budget.dart';
import 'package:counter_7/data_budget.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key, required this.budgetList});

  final List<Budget> budgetList;

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          ListTile(
            title: const Text('counter_7'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        MyHomePage(budgetList: widget.budgetList)),
              );
            },
          ),
          ListTile(
            title: const Text('Tambah Budget'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        TambahBudget(budgetList: widget.budgetList)),
              );
            },
          ),
          ListTile(
            title: const Text('Data Budget'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        DataBudget(budgetList: widget.budgetList)),
              );
            },
          ),
        ],
      ),
    );
  }
}
