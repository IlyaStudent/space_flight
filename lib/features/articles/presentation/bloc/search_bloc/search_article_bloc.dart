import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:space_flight/features/articles/domain/entities/article_entity.dart';
import 'package:space_flight/features/articles/domain/usecases/search_article.dart';

part 'search_article_event.dart';
part 'search_article_state.dart';

class SearchArticleBloc extends Bloc<SearchArticleEvent, SearchArticleState> {
  final SearchArticle searchArticle;

  SearchArticleBloc(this.searchArticle) : super(SearchArticleEmpty()) {
    on<SearchByTitleEvent>(_onEvent);
    on<ClearSearchCache>(_clearCache);
  }

  int offset = 0;

  Future<void> _clearCache(
    ClearSearchCache event,
    Emitter<SearchArticleState> emit,
  ) async {
    offset = 0;

    emit(SearchArticleEmpty());
  }

  Future<void> _onEvent(
    SearchByTitleEvent event,
    Emitter<SearchArticleState> emit,
  ) async {
    if (state is SearchArticleLoading) return;
    List<ArticleEntity> oldArticleList = [];

    final currentState = state;
    if (currentState is SearchArticleLoaded) {
      oldArticleList = currentState.articles;
    }
    emit(SearchArticleLoading(oldArticles: oldArticleList));
    final failureOrArticles = await searchArticle(
        QueryArticleParams(query: event.searchQuery, offset: offset));
    emit(failureOrArticles.fold(
      (failure) => const SearchArticleError(message: "Server failure"),
      (articles) {
        offset += 10;
        final oldArticles = (state as SearchArticleLoading).oldArticles;
        oldArticles.addAll(articles.results);
        return SearchArticleLoaded(articles: oldArticles);
      },
    ));
  }
}
