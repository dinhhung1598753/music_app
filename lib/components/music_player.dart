import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_app/providers/music_provider.dart';
import 'package:provider/provider.dart';

class MusicComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF03174C),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Container(
                height: 500.0,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              context.watch<MusicProvider>().music!.thumbnail),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            context
                                .watch<MusicProvider>()
                                .bgColor
                                .withOpacity(0.4),
                            context.watch<MusicProvider>().bgColor
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 52.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(50.0)),
                                child: Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.white,
                                ),
                              ),
                              Column(
                                children: [
                                  // Text(
                                  //   'PLAYLIST',
                                  //   style: TextStyle(
                                  //       color: Colors.white.withOpacity(0.6)),
                                  // ),
                                  // Text('Best Vibes of the Week',
                                  //     style: TextStyle(color: Colors.white)),
                                ],
                              ),
                              Icon(
                                Icons.playlist_add,
                                color: Colors.white,
                              )
                            ],
                          ),
                          Spacer(),
                          Text(context.watch<MusicProvider>().music!.name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32.0)),
                          SizedBox(
                            height: 6.0,
                          ),
                          Text(
                            context.watch<MusicProvider>().music!.name,
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontSize: 18.0),
                          ),
                          SizedBox(height: 16.0),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 42.0,
              ),
              Slider.adaptive(
                value: context
                    .watch<MusicProvider>()
                    .position
                    .inSeconds
                    .toDouble(),
                min: 0.0,
                max: context
                    .watch<MusicProvider>()
                    .duration
                    .inSeconds
                    .toDouble(),
                onChanged: (value) {},
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.fast_rewind,
                    color: Colors.white54,
                    size: 42.0,
                  ),
                  SizedBox(width: 32.0),
                  Container(
                    decoration: BoxDecoration(
                        color: context.watch<MusicProvider>().iconHoverColor,
                        borderRadius: BorderRadius.circular(50.0)),
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          onPressed: () {
                            Provider.of<MusicProvider>(context, listen: false)
                                .playMusic();
                            //10.lets Build the Pause button
                            context.read<MusicProvider>().playMusic();
                            if (Provider.of<MusicProvider>(context,
                                    listen: false)
                                .isPlaying) {
                              context.read<MusicProvider>().pause();
                            } else {
                              context.read<MusicProvider>().resume();
                            }
                          },
                          iconSize: 42.0,
                          icon: Icon(context.watch<MusicProvider>().btnIcon),
                          color: Colors.white,
                        )),
                  ),
                  SizedBox(width: 32.0),
                  Icon(
                    Icons.fast_forward,
                    color: Colors.white54,
                    size: 42.0,
                  ),
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(
                    Icons.bookmark_border,
                    color: context.watch<MusicProvider>().iconHoverColor,
                  ),
                  Icon(
                    Icons.shuffle,
                    color: context.watch<MusicProvider>().iconHoverColor,
                  ),
                  Icon(
                    Icons.repeat,
                    color: context.watch<MusicProvider>().iconHoverColor,
                  ),
                ],
              ),
              SizedBox(height: 58.0),
            ],
          ),
        ),
      ),
    );
  }
}
