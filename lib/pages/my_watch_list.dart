import 'package:flutter/material.dart';
import 'package:counter_7/drawer.dart';
import 'package:counter_7/models/budget.dart';
import 'package:counter_7/pages/my_watch_list_detail.dart';
import 'package:counter_7/utils/fetch_my_watch_list.dart';

class MyWatchListPage extends StatefulWidget {
  const MyWatchListPage({super.key, required this.budgetList});

  final List<Budget> budgetList;

  @override
  State<MyWatchListPage> createState() => _MyWatchListPageState();
}

class _MyWatchListPageState extends State<MyWatchListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Watch List'),
      ),
      drawer: MyDrawer(budgetList: widget.budgetList),
      body: FutureBuilder(
        future: fetchWatchList(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return Column(
                children: const [
                  Text(
                    'Tidak ada watch list',
                    style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return Container(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2.0,
                            color: (snapshot.data![index].fields.watched
                                ? Colors.blue
                                : Colors.red),
                          ),
                          borderRadius: BorderRadius.circular(15.0)),
                      child: ListTile(
                        title: Text(
                          snapshot.data![index].fields.title,
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Checkbox(
                          value: snapshot.data![index].fields.watched,
                          onChanged: (bool? value) {
                            setState(() {
                              snapshot.data![index].fields.watched = value!;
                            });
                          },
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyWatchListDetail(
                                      movie: snapshot.data![index],
                                      budgetList: widget.budgetList)));
                        },
                      ),
                    ),
                  ));
            }
          }
        },
      ),
    );
  }
}
