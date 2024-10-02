import 'package:flutter/material.dart';
import 'package:news/data/data_sources/api_manger.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/colors_palette.dart';
import '../../../data/models/articles_model.dart';
import '../viewModel/article_view_model.dart';
import 'article_item_widget.dart';

// Another solution
class ArticleListWidget extends StatelessWidget {
  final String sourceId;

  const ArticleListWidget({super.key, required this.sourceId});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ChangeNotifierProvider(
      create: (context) => ArticleViewModel()..getArticlesList(sourceId),
      child: Consumer<ArticleViewModel>(
        builder: (context, vm, _) {
          if (vm.articlesList.isEmpty) {
            return const Center(
              child: Text("Loading Data..."),
            );
          }
          return Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) =>
                  ArticleItemWidget(article: vm.articlesList[index]),
              itemCount: vm.articlesList.length,
              // itemCount: 3,
            ),
          );
        },
      ),
    );
    FutureBuilder<List<Article>>(
      future: ApiManager.fetchArticlesList(sourceId),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("Error fetching");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: ColorsPalette.primaryColor,
            ),
          );
        }
        List<Article> articleList = snapshot.data ?? [];
        // return CategoryViewDetails(sourceList: sourceList);
        return Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) =>
                ArticleItemWidget(article: articleList[index]),
            itemCount: articleList.length,
            // itemCount: 3,
          ),
        );
      },
    );
  }
}
