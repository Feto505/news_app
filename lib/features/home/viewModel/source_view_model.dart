//state management
import 'package:flutter/material.dart';
import 'package:news/data/data_sources/api_manger.dart';

import '../../../data/models/sources_model.dart';

class SourceViewModel extends ChangeNotifier {
  List<Source> _sourcesList = [];

  List<Source> get sourcesList => _sourcesList;

  Future<void> getSourcesList(String categoryId) async {
    _sourcesList = await ApiManager.fetchSourcesList(categoryId);
    notifyListeners();
  }
}
