import 'package:bloc/bloc.dart';
import 'package:insights_news/core/api/api_services.dart';
import 'package:insights_news/core/api/news_model/news_model.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  getNews(String category) async {
    emit(NewsLoadingState());
    try {
      await ApiServices().getNewsByCategory(category).then((value) {
        emit(NewsSuccessState(model: value!));
      });
    } catch (e) {
      emit(NewsErrorState(error: e.toString()));
    }
  }

  getSearch(String query) async {
    emit(SearchLoadingState());
    try {
      await ApiServices().getNewsBySearch(query).then((value) {
        emit(SearchSuccessState(model: value!));
      });
    } catch (e) {
      emit(SearchErrorState(error: e.toString()));
    }
  }
}
