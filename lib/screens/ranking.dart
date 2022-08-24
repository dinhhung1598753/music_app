import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:music_app/components/custom_bottom_navigation_bar.dart';
import 'package:music_app/providers/home_provider.dart';
import 'package:music_app/providers/music_provider.dart';
import 'package:provider/provider.dart';

import '../models/music.dart';
import '../providers/ranking_provider.dart';

class RankingPage extends StatelessWidget {
  bool initial = true;
  @override
  Widget build(BuildContext context) {
    if (initial) {
      context.read<RankingProvider>().getRanking();
      initial = false;
    }
    final ranking = context.watch<RankingProvider>().ranking;
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
            height: MediaQuery.of(context).size.height - 100,
            child: ListView(
                children: ranking != null
                    ? ranking.vn
                        .map((e) => RankingItem(e.thumbnail, e.singer, e.name, e.id))
                        .toList()
                    : [Container()]),
          ),
        )
      ]),
    );
  }
}

class RankingItem extends StatelessWidget {
  final String thumbnail;
  final String singer;
  final String name;
  final String id;
  RankingItem(this.thumbnail, this.singer, this.name, this.id);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Provider.of<MusicProvider>(context, listen: false).play(id, name, singer, thumbnail),
      child: Container(
        child: Row(children: [
          Image.network(
            this.thumbnail,
            height: 50,
            width: 50,
          ),
          Expanded(
              child: ListTile(
            title: Text(
              this.name,
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              this.singer,
              style: TextStyle(color: Colors.white),
            ),
          ))
        ]),
      ),
    );
  }
}
