import 'package:equatable/equatable.dart';

class LaunchEntity extends Equatable {
  final String launchId;
  final String provider;

  const LaunchEntity({required this.launchId, required this.provider});

  @override
  List<Object?> get props => [launchId, provider];
}
