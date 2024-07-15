import 'package:json_annotation/json_annotation.dart';
import 'package:space_flight/features/articles/data/models/article_model.dart';
import 'package:space_flight/features/articles/domain/entities/article_list_entity.dart';

part 'article_list_model.g.dart';

@JsonSerializable()
class ArticleListModel extends ArticleListEntity {
  const ArticleListModel({
    required super.count,
    required super.next,
    required super.previous,
    required super.results,
  });

  factory ArticleListModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleListModelFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleListModelToJson(this);
}
