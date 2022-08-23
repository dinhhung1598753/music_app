import 'package:flutter/material.dart';
import 'package:music_app/models/category.dart';

import '../repositories/music_repository.dart';

class HomeProvider extends ChangeNotifier {
  int _indexPage = 0;
  List<Category> categories = [];

  int get indexPage => _indexPage;
  void setIndexPage(int index) => {_indexPage = index, notifyListeners()};

  void getCategory() async {
    final categories = await fetchCategory();
    print(categories);
    this.categories = categories;
    notifyListeners();
  }
}
