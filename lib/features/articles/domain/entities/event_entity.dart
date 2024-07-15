import 'package:equatable/equatable.dart';

class EventEntity extends Equatable {
  final int eventId;
  final String provider;

  const EventEntity({required this.eventId, required this.provider});

  @override
  List<Object?> get props => [eventId, provider];
}
