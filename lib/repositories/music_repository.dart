import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/category.dart';
import '../models/ranking.dart';

Future<String> getStreaming(String id) async {
  final response = await http.get(
      Uri.parse('https://ec95-42-115-83-90.ap.ngrok.io/streaming?id=${id}'));

  if (response.statusCode == 200) {
    String jsonResults = response.body;

    return jsonResults;
  } else {
    throw Exception('Failed to load streaming');
  }
}

Future<List<Category>> fetchCategory() async {
  final response =
      await http.get(Uri.parse('https://ec95-42-115-83-90.ap.ngrok.io/'));

  if (response.statusCode == 200) {
    List<dynamic> jsonResults = jsonDecode(response.body);

    final categories = jsonResults.map((e) => Category.fromJson(e));
    return categories.toList();
  } else {
    throw Exception('Failed to load album');
  }
}

Future<Ranking> fetchRanking() async {
  final response = await http
      .get(Uri.parse('https://ec95-42-115-83-90.ap.ngrok.io/ranking'));

  if (response.statusCode == 200) {
    Map<String, dynamic> jsonResults = jsonDecode(response.body);
    final ranking = Ranking.fromJson(jsonResults);
    return ranking;
  } else {
    throw Exception('Failed to load album');
  }
}
