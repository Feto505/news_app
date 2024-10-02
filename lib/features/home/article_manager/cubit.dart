import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/features/home/article_manager/states.dart';
import '../../../data/data_sources/api_manger.dart';
import '../../../data/models/articles_model.dart';

class ArticleCubit extends Cubit<ArticlesStates> {
  ArticleCubit() : super(InitializeArticleState());
  List<Article> _articlesList = [];

  List<Article> get articlesList => _articlesList;

  static ArticleCubit get(context) => BlocProvider.of(context);

  Future<void> getNewsArticlesList(String categoryId) async {
    try {
      _articlesList = await ApiManager.fetchArticlesList(categoryId);
      emit(SuccessArticleState());
    } catch (error) {
      emit(ErrorArticleState());
    }
  }
}
