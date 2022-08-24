import 'music.dart';

class Ranking {
  final List<Music> korea;
  final List<Music> us;
  final List<Music> vn;
  Ranking(this.korea, this.us, this.vn);

  Ranking.fromJson(Map<String, dynamic> json)
      : korea = json['korea'].map((e) => Music.fromJson(e)).toList(),
        us = json['us'].map((e) => Music.fromJson(e)).toList(),
        vn = json['vn'].map((e) => Music.fromJson(e)).toList();
}
