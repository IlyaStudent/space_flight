import 'package:json_annotation/json_annotation.dart';
import 'package:space_flight/features/articles/data/models/event_model.dart';
import 'package:space_flight/features/articles/data/models/launch_model.dart';
import 'package:space_flight/features/articles/domain/entities/article_entity.dart';

part 'article_model.g.dart';

@JsonSerializable()
class ArticleModel extends ArticleEntity {
  const ArticleModel({
    required super.id,
    required super.title,
    required super.url,
    required super.imageUrl,
    required super.newsSite,
    required super.summary,
    required super.publishedAt,
    required super.updatedAt,
    required super.featured,
    required super.launches,
    required super.events,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleModelFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleModelToJson(this);
}
