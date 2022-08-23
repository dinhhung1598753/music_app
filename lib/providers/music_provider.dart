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

  Music? _music = Music(
      name: 'Bên trên tầng lầu',
      singer: 'Tăng Duy tân',
      thumbnail:
          "https://photo-resize-zmp3.zmdcdn.me/w240_r1x1_jpeg/avatars/d/d/d/a/ddda5f9fec1f2ef6c499831661727263.jpg",
      url:
          "https://vnno-vn-6-tf-mp3-s1-zmp3.zmdcdn.me/4a736dacbbed52b30bfc/1734412333280030724?authen=exp=1661094891~acl=/4a736dacbbed52b30bfc/*~hmac=2bebf2e6d4becda4b6b5398de494aa2a&fs=MTY2MDkyMjA5MTmUsICwNHx3ZWJWNnwwfDEdUngNTMdUngNjgdUngMTmUsIC5");

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

  Music? get music => _music;
  void setIndexPage(Music? music) => {_music = music, notifyListeners()};
  void close() {
    pause();
    _music = null;
    notifyListeners();
  }
}
