part of 'search_article_bloc.dart';

sealed class SearchArticleEvent extends Equatable {
  const SearchArticleEvent();

  @override
  List<Object> get props => [];
}

final class SearchByTitleEvent extends SearchArticleEvent {
  final String searchQuery;

  const SearchByTitleEvent(this.searchQuery);

  @override
  List<Object> get props => [searchQuery];
}

final class ClearSearchCache extends SearchArticleEvent {}
