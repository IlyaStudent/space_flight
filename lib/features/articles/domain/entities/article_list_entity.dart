import 'package:equatable/equatable.dart';
import 'package:space_flight/features/articles/domain/entities/article_entity.dart';

class ArticleListEntity extends Equatable {
  final int count;
  final String next;
  final String? previous;
  final List<ArticleEntity> results;

  const ArticleListEntity({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  @override
  List<Object?> get props => [count, next, previous, results];
}
