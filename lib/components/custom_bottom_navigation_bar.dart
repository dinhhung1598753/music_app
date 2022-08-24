import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../models/music.dart';
import '../providers/app_provider.dart';
import '../providers/home_provider.dart';
import '../providers/music_provider.dart';
import 'custom_modal_bottom_sheet.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Music? music = context.watch<MusicProvider>().music;
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 10.0,
          sigmaY: 10.0,
        ),
        child: Container(
          height: 85 + (music == null ? 0 : 75),
          color: Color(0xff353838).withOpacity(0.9),
          child: Column(
            children: [
              context.watch<MusicProvider>().music != null
                  ? Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(children: [
                        CircleAvatar(
                          radius: 22.0,
                          backgroundImage: NetworkImage(
                              "http://vnnews24h.net/img_data/images/day-cho-con-lam-quen-khi-ve-nha-moi.jpg"),
                          backgroundColor: Colors.transparent,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              showModalBottom(context);
                            },
                            child: ListTile(
                              title: Text(
                                  context.watch<MusicProvider>().music!.name),
                              subtitle: Text(
                                  context.watch<MusicProvider>().music!.singer),
                            ),
                          ),
                        ),
                        InkWell(
                            onTap: () {
                              Provider.of<MusicProvider>(context, listen: false)
                                  .playMusic();
                              if (Provider.of<MusicProvider>(context,
                                      listen: false)
                                  .isPlaying) {
                                context.read<MusicProvider>().pause();
                              } else {
                                context.read<MusicProvider>().resume();
                              }
                            },
                            child: FaIcon(
                                context.watch<MusicProvider>().isPlaying
                                    ? FontAwesomeIcons.pause
                                    : FontAwesomeIcons.play)),
                        Padding(padding: EdgeInsets.all(10)),
                        InkWell(
                          child: FaIcon(FontAwesomeIcons.xmark),
                          onTap: context.read<MusicProvider>().close,
                        )
                      ]),
                    )
                  : Container(),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 40.0),
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Colors.black),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomBottomNavigationBarItem(
                      text: 'Home',
                      icon: FontAwesomeIcons.house,
                      activeIndex: 0,
                    ),
                    CustomBottomNavigationBarItem(
                      text: 'Navigator',
                      icon: FontAwesomeIcons.solidCompass,
                      activeIndex: 1,
                    ),
                    CustomBottomNavigationBarItem(
                      text: 'Chat',
                      icon: FontAwesomeIcons.commentDots,
                      activeIndex: 2,
                    ),
                    CustomBottomNavigationBarItem(
                      text: 'Profile',
                      icon: FontAwesomeIcons.user,
                      activeIndex: 3,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomBottomNavigationBarItem extends StatelessWidget {
  final IconData? icon;
  final String? text;
  final int? activeIndex;
  const CustomBottomNavigationBarItem(
      {String? this.text, IconData? this.icon, int? this.activeIndex = 0});

  @override
  Widget build(BuildContext context) {
    Color color = this.activeIndex! == context.watch<AppProvider>().indexPage
        ? Colors.amber
        : Colors.white;
    return InkWell(
      onTap: () {
        context.read<AppProvider>().setIndexPage(this.activeIndex!);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(
            icon,
            color: color,
          ),
          Padding(padding: EdgeInsets.all(3)),
          Text(
            text!,
            style: TextStyle(color: color, fontSize: 8),
          )
        ],
      ),
    );
  }
}
