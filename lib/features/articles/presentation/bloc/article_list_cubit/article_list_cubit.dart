import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:space_flight/core/error/failure.dart';
import 'package:space_flight/features/articles/domain/entities/article_entity.dart';
import 'package:space_flight/features/articles/domain/usecases/get_all_articles.dart';

part 'article_list_state.dart';

class ArticleListCubit extends Cubit<ArticleListState> {
  final GetAllArticles getAllArticles;

  ArticleListCubit({required this.getAllArticles}) : super(ArticleListEmpty());

  int offset = 0;

  Future<void> refreshPage() async {
    offset = 0;
    emit(ArticleListEmpty());
    loadArticles();
  }

  void loadArticles() async {
    if (state is ArticleListLoading) return;

    final currentState = state;

    List<ArticleEntity> oldArticlesList = [];

    if (currentState is ArticleListLoaded) {
      oldArticlesList = currentState.articlesList;
    }

    emit(ArticleListLoading(oldArticlesList, isFirstFetch: offset == 0));

    final failureOrArticleList =
        await getAllArticles(PageArticleParams(limit: 10, offset: offset));
    failureOrArticleList.fold(
      (error) => emit(ArticleListError(message: _mapFailureToMessage(error))),
      (articleList) {
        offset += 10;
        final articles = (state as ArticleListLoading).oldArticlesList;
        articles.addAll(articleList.results);
        emit(ArticleListLoaded(articles));
      },
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure _:
        return "Server failure";
      default:
        return "Unexpected error";
    }
  }
}
