// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleListModel _$ArticleListModelFromJson(Map<String, dynamic> json) =>
    ArticleListModel(
      count: (json['count'] as num).toInt(),
      next: json['next'] as String,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => ArticleModel.fromJson(e))
          .toList(),
    );

Map<String, dynamic> _$ArticleListModelToJson(ArticleListModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
