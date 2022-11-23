import 'package:counter_7/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/drawer.dart';
import 'package:counter_7/models/budget.dart';
import 'package:intl/intl.dart';

class MyWatchListDetail extends StatelessWidget {
  const MyWatchListDetail(
      {super.key, required this.movie, required this.budgetList});

  final Movie movie;
  final List<Budget> budgetList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Budget'),
      ),
      drawer: MyDrawer(budgetList: budgetList),
      body: Container(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(movie.fields.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 24.0, fontWeight: FontWeight.bold)),
                ),
                Row(
                  children: [
                    const Text('Release Date: ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(DateFormat.yMMMMd('en_US')
                        .format(movie.fields.releaseDate)),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Text('Rating: ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('${movie.fields.rating}/5'),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Text('Status: ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(movie.fields.watched ? 'watched' : 'not watched'),
                  ],
                ),
                const SizedBox(height: 8),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Review: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(movie.fields.review),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Back'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
