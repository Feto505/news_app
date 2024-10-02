import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/core/config/page_routes_name.dart';
import 'package:news/features/home/pages/home_view.dart';
import 'package:news/features/home/pages/search.dart';
import 'package:news/features/home/widget/article_details_widget.dart';
import 'package:news/features/splash/pages/splash_view.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRoutesName.initial:
        return MaterialPageRoute(
            builder: (context) => const SplashView(), settings: settings);
      case PageRoutesName.home:
        return MaterialPageRoute(
            builder: (context) => const HomeView(), settings: settings);

      case PageRoutesName.article_widget:
        return MaterialPageRoute(
            builder: (context) => const ArticleDetailsWidget(),
            settings: settings);

      case PageRoutesName.search:
        return MaterialPageRoute(
            builder: (context) => const Search(), settings: settings);

      default:
        return MaterialPageRoute(
            builder: (context) => const SplashView(), settings: settings);
    }
  }
}
