import 'package:json_annotation/json_annotation.dart';
import 'package:space_flight/features/articles/domain/entities/launch_entity.dart';

part 'launch_model.g.dart';

@JsonSerializable()
class LaunchModel extends LaunchEntity {
  const LaunchModel({required super.launchId, required super.provider});

  factory LaunchModel.fromJson(Map<String, dynamic> json) =>
      _$LaunchModelFromJson(json);
  Map<String, dynamic> toJson() => _$LaunchModelToJson(this);
}
