// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleModel _$ArticleModelFromJson(Map<String, dynamic> json) => ArticleModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      url: json['url'] as String,
      imageUrl: json['image_url'] as String,
      newsSite: json['news_site'] as String,
      summary: json['summary'] as String,
      publishedAt: json['published_at'] as String,
      updatedAt: json['updated_at'] as String,
      featured: json['featured'] as bool,
      events: (json['events'] as List<dynamic>)
          .map((e) => EventModel.fromJson(e))
          .toList(),
      launches: (json['launches'] as List<dynamic>)
          .map((e) => LaunchModel.fromJson(e))
          .toList(),
    );

Map<String, dynamic> _$ArticleModelToJson(ArticleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
      'imageUrl': instance.imageUrl,
      'newsSite': instance.newsSite,
      'summary': instance.summary,
      'publishedAt': instance.publishedAt,
      'updatedAt': instance.updatedAt,
      'featured': instance.featured,
    };
