import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:space_flight/core/error/failure.dart';
import 'package:space_flight/core/usecases/usecase.dart';
import 'package:space_flight/features/articles/domain/entities/article_list_entity.dart';
import 'package:space_flight/features/articles/domain/repositories/article_repository.dart';

class GetAllArticles extends UseCase<ArticleListEntity, PageArticleParams> {
  final ArticleRepository articleRepository;

  GetAllArticles(this.articleRepository);

  @override
  Future<Either<Failure, ArticleListEntity>> call(
      PageArticleParams params) async {
    return await articleRepository.getAllArticles(params.limit, params.offset);
  }
}

class PageArticleParams extends Equatable {
  final int limit;
  final int offset;

  const PageArticleParams({required this.limit, required this.offset});

  @override
  List<Object?> get props => [limit, offset];
}
