import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:music_app/components/custom_bottom_navigation_bar.dart';
import 'package:music_app/providers/home_provider.dart';
import 'package:music_app/providers/music_provider.dart';
import 'package:provider/provider.dart';

import '../models/music.dart';

class RankingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Music> arr = [
      Music(
          name: "Nhìn về phía em",
          singer: "Đình Dũng",
          thumbnail:
              "https://photo-resize-zmp3.zmdcdn.me/w94_r1x1_jpeg/cover/2/2/7/5/2275dda526935755fc51b587e08e1d7e.jpg",
          url: "123")
    ];
    return Container(
      child: Column(children: [
        Container(
          child: Text('US-UK'),
          color: Colors.red,
          height: 100,
          width: MediaQuery.of(context).size.width,
        ),
        SingleChildScrollView(
          child: Container(
            height: 200,
            child: ListView(
                children: arr
                    .map((e) => RankingItem(e.thumbnail, e.singer, e.name))
                    .toList()),
          ),
        )
      ]),
    );
  }
}

class RankingItem extends StatelessWidget {
  final String thumbnail;
  final String singer;
  final String music;
  RankingItem(this.thumbnail, this.singer, this.music);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        Image.network(
          this.thumbnail,
          height: 50,
          width: 50,
        ),
        Expanded(
            child: ListTile(
          title: Text(
            this.music,
            style: TextStyle(color: Colors.white),
          ),
          subtitle: Text(
            this.singer,
            style: TextStyle(color: Colors.white),
          ),
        ))
      ]),
    );
  }
}
