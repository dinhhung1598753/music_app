import 'package:flutter/material.dart';
import 'package:music_app/models/ranking.dart';

import '../repositories/music_repository.dart';

class RankingProvider extends ChangeNotifier {
  Ranking? ranking;

  void getRanking() async {
    final ranking = await fetchRanking();
    print(ranking);
    this.ranking = ranking;
    notifyListeners();
  }
}
