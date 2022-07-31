import 'package:flutter/material.dart';

import '../models/music.dart';

class MusicProvider extends ChangeNotifier {
  Music? _music = Music(name: 'abc', singer: 'abcbsda adkasdn');

  Music? get music => _music;
  void setIndexPage(Music? music) => {_music = music, notifyListeners()};
  void close() => {_music = null, notifyListeners()};
}
