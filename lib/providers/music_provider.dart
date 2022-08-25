import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_app/repositories/music_repository.dart';

import '../models/music.dart';

class MusicProvider extends ChangeNotifier {
  IconData btnIcon = Icons.play_arrow;
  var bgColor = const Color(0xFF03174C);
  var iconHoverColor = const Color(0xFF065BC3);

  Duration duration = new Duration();
  Duration position = new Duration();

  // Now add music player
  AudioPlayer audioPlayer = new AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);
  bool isPlaying = false;
  String currentSong = "";

  Music? _music = null;
  void playMusic() async {
    if (isPlaying && currentSong != _music!.url) {
      audioPlayer.pause();
      int result = await audioPlayer.play(_music!.url);
      if (result == 1) {
        currentSong = _music!.url;
        notifyListeners();
      }
    } else if (!isPlaying) {
      int result = await audioPlayer.play(_music!.url);
      if (result == 1) {
        isPlaying = true;
        btnIcon = Icons.pause;
        notifyListeners();
      }
    }
    audioPlayer.onDurationChanged.listen((event) {
      duration = event;
      notifyListeners();
    });

    audioPlayer.onAudioPositionChanged.listen((event) {
      position = event;
      notifyListeners();
    });
  }

  void pause() {
    audioPlayer.pause();
    btnIcon = Icons.play_arrow;
    isPlaying = false;
    notifyListeners();
  }

  void resume() {
    audioPlayer.resume();
    btnIcon = Icons.pause;
    isPlaying = true;
    notifyListeners();
  }

  void play(String id, String name, String singer, String thumbnail) async {
    final url = await getStreaming(id);
    _music = Music(
        id: id, name: name, singer: singer, thumbnail: thumbnail, url: url);
    playMusic();
  }

  Music? get music => _music;
  void setIndexPage(Music? music) => {_music = music, notifyListeners()};
  void close() {
    pause();
    _music = null;
    notifyListeners();
  }
}
