import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:space_flight/core/error/failure.dart';
import 'package:space_flight/core/usecases/usecase.dart';
import 'package:space_flight/features/articles/domain/entities/article_list_entity.dart';
import 'package:space_flight/features/articles/domain/repositories/article_repository.dart';

class SearchArticle extends UseCase<ArticleListEntity, QueryArticleParams> {
  final ArticleRepository articleRepository;

  SearchArticle(this.articleRepository);

  @override
  Future<Either<Failure, ArticleListEntity>> call(
      QueryArticleParams params) async {
    return await articleRepository.searchArticle(params.query, params.offset);
  }
}

class QueryArticleParams extends Equatable {
  final String query;
  final int offset;

  const QueryArticleParams({required this.query, required this.offset});

  @override
  List<Object?> get props => [query];
}
