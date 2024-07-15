part of 'article_by_id_bloc.dart';

sealed class ArticleByIdState extends Equatable {
  const ArticleByIdState();

  @override
  List<Object> get props => [];
}

final class ArticleInfoEmpty extends ArticleByIdState {}

final class ArticleInfoLoading extends ArticleByIdState {}

final class ArticleInfoLoaded extends ArticleByIdState {
  final ArticleEntity articleEntity;

  const ArticleInfoLoaded({required this.articleEntity});

  @override
  List<Object> get props => [articleEntity];
}

final class ArticleInfoError extends ArticleByIdState {
  final String message;

  const ArticleInfoError({required this.message});

  @override
  List<Object> get props => [message];
}
