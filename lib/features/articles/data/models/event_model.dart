import 'package:json_annotation/json_annotation.dart';
import 'package:space_flight/features/articles/domain/entities/event_entity.dart';

part 'event_model.g.dart';

@JsonSerializable()
class EventModel extends EventEntity {
  const EventModel({required super.eventId, required super.provider});

  factory EventModel.fromJson(Map<String, dynamic> json) =>
      _$EventModelFromJson(json);
  Map<String, dynamic> toJson() => _$EventModelToJson(this);
}
