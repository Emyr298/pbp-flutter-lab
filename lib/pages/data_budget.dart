import 'package:flutter/material.dart';
import 'package:counter_7/drawer.dart';
import 'package:counter_7/models/budget.dart';

class DataBudget extends StatelessWidget {
  const DataBudget({super.key, required this.budgetList});

  final List<Budget> budgetList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Budget'),
      ),
      drawer: MyDrawer(budgetList: budgetList),
      body: Container(
        padding: const EdgeInsets.all(4.0),
        child: ListView.builder(
          itemCount: budgetList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Card(
                child: ListTile(
                  title: Text(
                    budgetList[index].judul,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(
                    '${budgetList[index].nominal.toString()}, ${budgetList[index].getTanggalString()}',
                    style: const TextStyle(color: Colors.black),
                  ),
                  trailing: Text(budgetList[index].tipe),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
