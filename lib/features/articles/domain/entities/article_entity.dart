import 'package:equatable/equatable.dart';
import 'package:space_flight/features/articles/domain/entities/event_entity.dart';
import 'package:space_flight/features/articles/domain/entities/launch_entity.dart';

class ArticleEntity extends Equatable {
  final int id;
  final String title;
  final String url;
  final String imageUrl;
  final String newsSite;
  final String summary;
  final String publishedAt;
  final String updatedAt;
  final bool featured;
  final List<LaunchEntity> launches;
  final List<EventEntity> events;

  const ArticleEntity(
      {required this.id,
      required this.title,
      required this.url,
      required this.imageUrl,
      required this.newsSite,
      required this.summary,
      required this.publishedAt,
      required this.updatedAt,
      required this.featured,
      required this.launches,
      required this.events});

  @override
  List<Object?> get props => [
        id,
        title,
        url,
        imageUrl,
        newsSite,
        summary,
        publishedAt,
        updatedAt,
        featured,
        launches,
        events,
      ];
}
