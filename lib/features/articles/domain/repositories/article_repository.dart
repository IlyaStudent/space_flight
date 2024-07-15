import 'package:dartz/dartz.dart';
import 'package:space_flight/core/error/failure.dart';
import 'package:space_flight/features/articles/domain/entities/article_entity.dart';
import 'package:space_flight/features/articles/domain/entities/article_list_entity.dart';

abstract class ArticleRepository {
  Future<Either<Failure, ArticleListEntity>> getAllArticles(
    int limit,
    int offset,
  );

  Future<Either<Failure, ArticleEntity>> getArticleById(String id);

  Future<Either<Failure, ArticleListEntity>> searchArticle(
      String query, int offset);
}
