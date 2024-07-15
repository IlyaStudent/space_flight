import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:space_flight/core/error/failure.dart';
import 'package:space_flight/core/usecases/usecase.dart';
import 'package:space_flight/features/articles/domain/entities/article_entity.dart';
import 'package:space_flight/features/articles/domain/repositories/article_repository.dart';

class GetArticleById extends UseCase<ArticleEntity, IdArticleParams> {
  final ArticleRepository articleRepository;

  GetArticleById(this.articleRepository);

  @override
  Future<Either<Failure, ArticleEntity>> call(IdArticleParams params) async {
    return await articleRepository.getArticleById(params.id);
  }
}

class IdArticleParams extends Equatable {
  final String id;

  const IdArticleParams({required this.id});

  @override
  List<Object?> get props => [id];
}
