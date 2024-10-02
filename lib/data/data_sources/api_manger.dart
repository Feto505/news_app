import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/core/constants.dart';

import '../models/articles_model.dart';
import '../models/sources_model.dart';

class ApiManager {
  static Future<List<Source>> fetchSourcesList(String categoryId) async {
    // GET https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY
    var url = Uri.https(
      Constants.domain,
      "/v2/top-headlines/sources",
      {
        "apiKey": Constants.apiKey,
        "category": categoryId,
      },
    );
    final response = await http.get(url);
    if (response.statusCode == 200) {
      //Parsing
      Map<String, dynamic> data = jsonDecode(response.body);
      SourcesModel sourcesModel = SourcesModel.fromJson(data);
      return sourcesModel.sources;
    } else {
      throw Exception("Failed to get source list");
    }
  }

  static Future<List<Article>> fetchArticlesList(String sourceId) async {
    var url = Uri.https(
      Constants.domain,
      "/v2/top-headlines",
      {
        "apiKey": Constants.apiKey,
        "sources": sourceId,
      },
    );
    final response = await http.get(url);
    if (response.statusCode == 200) {
      //Parsing
      Map<String, dynamic> data = jsonDecode(response.body);
      ArticlesModel articlesModel = ArticlesModel.fromJson(data);
      return articlesModel.articles;
    } else {
      throw Exception("Failed to get source list");
    }
  }

// static Future<List<Article>> fetchArticlesList({String? sourceId,String? q}) async{
//   // GET https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY
//   var url = Uri.https(
//     Constants.domain,
//     "/v2/top-headlines",
//     {
//       if (sourceId !=null) "sources":sourceId ?? '',
//       if (q != null) 'q':q,
//       "apiKey": Constants.apiKey,
//
//     },
//   );
//   final response = await http.get(url);
//   if(response.statusCode == 200){
//     //Parsing
//     Map<String, dynamic> data = jsonDecode(response.body);
//     ArticlesModel articlesModel = ArticlesModel.fromJson(data);
//     return articlesModel.articles;
//
//   }else{
//     throw Exception("Failed to get source list");
//   }
// }
}
