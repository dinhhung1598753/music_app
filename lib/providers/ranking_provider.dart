import 'package:flutter/material.dart';
import 'package:music_app/models/ranking.dart';

import '../models/music.dart';
import '../repositories/music_repository.dart';

class RankingProvider extends ChangeNotifier {
  Ranking? _ranking;
  int _index = 0;
  List<Music> _playlist = [];

  void getRanking() async {
    final ranking = await fetchRanking();
    this._ranking = ranking;
    notifyListeners();
  }

  int get index => _index;
  void setIndex(int index) {
    _index = index;
    if (_index == 2) {
      _playlist = _ranking!.korea;
    } else if (_index == 1) {
      _playlist = _ranking!.us;
    } else {
      _playlist = _ranking!.vn;
    }
    notifyListeners();
  }

  List<Music> get playlist => _playlist;
}
