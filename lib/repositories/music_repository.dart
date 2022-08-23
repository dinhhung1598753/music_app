import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/category.dart';

Future<List<Category>> fetchCategory() async {
  final response =
      await http.get(Uri.parse('https://918e-1-54-134-246.ap.ngrok.io/'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    // return Album.fromJson(jsonDecode(response.body));

    List<dynamic> jsonResults = jsonDecode(response.body);

    final categories = jsonResults.map((e) => Category.fromJson(e));
    return categories.toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
