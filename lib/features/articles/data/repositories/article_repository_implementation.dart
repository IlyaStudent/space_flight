import 'package:dartz/dartz.dart';
import 'package:space_flight/core/error/failure.dart';
import 'package:space_flight/core/networking/network_info.dart';
import 'package:space_flight/features/articles/data/datasources/article_remote_data_source.dart';
import 'package:space_flight/features/articles/domain/entities/article_entity.dart';
import 'package:space_flight/features/articles/domain/entities/article_list_entity.dart';
import 'package:space_flight/features/articles/domain/repositories/article_repository.dart';

class ArticleRepositoryImplementation implements ArticleRepository {
  final ArticleRemoteDataSource articleRemoteDataSource;
  final NetworkInfo networkInfo;

  ArticleRepositoryImplementation({
    required this.articleRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, ArticleListEntity>> getAllArticles(
      int limit, int offset) async {
    if (await networkInfo.isConnected) {
      final remoteArticle =
          await articleRemoteDataSource.getAllArticles(limit, offset);
      return Right(remoteArticle);
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ArticleEntity>> getArticleById(String id) async {
    if (await networkInfo.isConnected) {
      final remoteArticle = await articleRemoteDataSource.getArticleById(id);
      return Right(remoteArticle);
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ArticleListEntity>> searchArticle(
      String query, int offset) async {
    if (await networkInfo.isConnected) {
      final remoteArticle =
          await articleRemoteDataSource.searchArticle(query, offset);
      return Right(remoteArticle);
    } else {
      return Left(ServerFailure());
    }
  }
}
