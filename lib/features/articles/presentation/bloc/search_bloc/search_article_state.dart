part of 'search_article_bloc.dart';

sealed class SearchArticleState extends Equatable {
  const SearchArticleState();

  @override
  List<Object> get props => [];
}

final class SearchArticleEmpty extends SearchArticleState {}

final class SearchArticleLoading extends SearchArticleState {
  final List<ArticleEntity> oldArticles;

  const SearchArticleLoading({required this.oldArticles});

  @override
  List<Object> get props => [oldArticles];
}

final class SearchArticleLoaded extends SearchArticleState {
  final List<ArticleEntity> articles;

  const SearchArticleLoaded({required this.articles});

  @override
  List<Object> get props => [articles];
}

final class SearchArticleError extends SearchArticleState {
  final String message;

  const SearchArticleError({required this.message});

  @override
  List<Object> get props => [message];
}
