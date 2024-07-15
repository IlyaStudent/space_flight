part of 'article_list_cubit.dart';

sealed class ArticleListState extends Equatable {
  const ArticleListState();

  @override
  List<Object> get props => [];
}

final class ArticleListEmpty extends ArticleListState {}

final class ArticleListLoading extends ArticleListState {
  final List<ArticleEntity> oldArticlesList;
  final bool isFirstFetch;

  const ArticleListLoading(this.oldArticlesList, {this.isFirstFetch = false});

  @override
  List<Object> get props => [oldArticlesList];
}

final class ArticleListLoaded extends ArticleListState {
  final List<ArticleEntity> articlesList;

  const ArticleListLoaded(this.articlesList);

  @override
  List<Object> get props => [articlesList];
}

final class ArticleListError extends ArticleListState {
  final String message;

  const ArticleListError({required this.message});

  @override
  List<Object> get props => [message];
}
