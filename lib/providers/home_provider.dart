import 'package:flutter/material.dart';
import 'package:music_app/models/category.dart';

import '../repositories/music_repository.dart';

class HomeProvider extends ChangeNotifier {
  List<Category> categories = [];

  void getCategory() async {
    final categories = await fetchCategory();
    print(categories);
    this.categories = categories;
    notifyListeners();
  }
}
