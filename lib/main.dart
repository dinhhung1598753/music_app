import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:music_app/providers/app_provider.dart';
import 'package:music_app/providers/home_provider.dart';
import 'package:music_app/providers/music_provider.dart';
import 'package:music_app/screens/home.dart';
import 'package:provider/provider.dart';

import 'components/custom_bottom_navigation_bar.dart';
import 'providers/ranking_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AppProvider()),
      ChangeNotifierProvider(create: (_) => HomeProvider()),
      ChangeNotifierProvider(create: (_) => MusicProvider()),
      ChangeNotifierProvider(create: (_) => RankingProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.black,
            body: Stack(
              children: [
                context.watch<AppProvider>().screen,
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomBottomNavigationBar(),
                )
              ],
            )),
      ),
    );
  }
}
