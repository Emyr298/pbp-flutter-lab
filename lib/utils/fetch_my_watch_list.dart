import 'package:counter_7/models/movie.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Movie>> fetchWatchList() async {
  var url =
      Uri.parse('https://pbp-tugas-2-emyr298.herokuapp.com/mywatchlist/json/');
  var response = await http.get(
    url,
    headers: {
      'Access-Control-Allow-Origin': '*',
      'Content-Type': 'application/json',
    },
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<Movie> listWatchList = [];
  for (var element in data) {
    if (element != null) {
      listWatchList.add(Movie.fromJson(element));
    }
  }

  return listWatchList;
}
