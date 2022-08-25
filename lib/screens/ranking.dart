import 'package:flutter/material.dart';
import 'package:music_app/providers/music_provider.dart';
import 'package:provider/provider.dart';

import '../models/music.dart';
import '../providers/ranking_provider.dart';

const listTitle = ["#VietNam-Ranking", "#US-UK-RANKING", "#KOREA-RANKING"];

class RankingPage extends StatelessWidget {
  bool initial = true;
  @override
  Widget build(BuildContext context) {
    if (initial) {
      context.read<RankingProvider>().getRanking();
      initial = false;
    }
    final playlist = context.watch<RankingProvider>().playlist;

    final index = context.watch<RankingProvider>().index;

    BorderSide getBorderSide(int _index) {
      return _index == index
          ? BorderSide(color: Colors.amberAccent, width: 3)
          : BorderSide(color: Colors.grey, width: 1);
    }

    final title = listTitle[index];

    return Container(
      child: Column(children: [
        Container(
          padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // padding: EdgeInsets.only(left: 10),
                child: Text(
                  title,
                  style: TextStyle(
                      color: Colors.amber,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(padding: EdgeInsets.all(10)),
              Row(
                children: [
                  Expanded(
                      child: InkWell(
                    onTap: () =>
                        Provider.of<RankingProvider>(context, listen: false)
                            .setIndex(0),
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border(bottom: getBorderSide(0))),
                        padding: EdgeInsets.all(5),
                        child: Center(
                            child: Text(
                          'V-pop',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ))),
                  )),
                  Expanded(
                      child: InkWell(
                    onTap: () =>
                        Provider.of<RankingProvider>(context, listen: false)
                            .setIndex(1),
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border(bottom: getBorderSide(1))),
                        padding: EdgeInsets.all(5),
                        child: Center(
                            child: Text(
                          'US-UK',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ))),
                  )),
                  Expanded(
                      child: InkWell(
                    onTap: () =>
                        Provider.of<RankingProvider>(context, listen: false)
                            .setIndex(2),
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border(bottom: getBorderSide(2))),
                        padding: EdgeInsets.all(5),
                        child: Center(
                            child: Text(
                          'K-pop',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ))),
                  )),
                ],
              ),
            ],
          ),
          color: Colors.black,
          height: 110,
          width: MediaQuery.of(context).size.width,
        ),
        SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 100),
            height: MediaQuery.of(context).size.height - 100,
            child: ListView(
                children: playlist
                    .map(
                        (e) => RankingItem(e.thumbnail, e.singer, e.name, e.id))
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
  final String name;
  final String id;
  RankingItem(this.thumbnail, this.singer, this.name, this.id);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Provider.of<MusicProvider>(context, listen: false)
          .play(id, name, singer, thumbnail),
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
