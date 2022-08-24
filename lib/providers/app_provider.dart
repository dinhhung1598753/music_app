import 'package:flutter/material.dart';

import '../screens/home.dart';
import '../screens/ranking.dart';

List<Widget> screens = [HomePage(), RankingPage()];

class AppProvider extends ChangeNotifier {
  int _indexPage = 0;
  Widget screen = screens[0];

  int get indexPage => _indexPage;
  void setIndexPage(int index) {
    _indexPage = index;
    screen = screens[index];
    notifyListeners();
  }
}
