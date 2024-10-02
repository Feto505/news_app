import 'package:flutter/material.dart';
import 'package:news/data/models/articles_model.dart';

import '../../../data/data_sources/api_manger.dart';

class ArticleViewModel extends ChangeNotifier {
  List<Article> _articlesList = [];

  List<Article> get articlesList => _articlesList;

  Future<void> getArticlesList(String sourceId) async {
    _articlesList = await ApiManager.fetchArticlesList(sourceId);
    notifyListeners();
  }
}
