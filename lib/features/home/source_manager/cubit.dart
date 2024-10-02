import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/data/data_sources/api_manger.dart';
import 'package:news/data/models/sources_model.dart';
import 'package:news/features/home/source_manager/states.dart';

class SourceCubit extends Cubit<SourcesStates> {
  SourceCubit() : super(InitializeSourceState());
  List<Source> _sourcesList = [];

  List<Source> get sourcesList => _sourcesList;

  static SourceCubit get(context) => BlocProvider.of(context);

  Future<void> getNewsSourcesList(String categoryId) async {
    try {
      _sourcesList = await ApiManager.fetchSourcesList(categoryId);
      emit(SuccessSourceState());
    } catch (error) {
      emit(ErrorSourceState());
    }
  }
}
