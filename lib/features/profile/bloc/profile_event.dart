import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object?> get props => [];
}

class FetchUserProfileEvent extends ProfileEvent {
  final String userId;

  FetchUserProfileEvent(this.userId);

  @override
  List<Object?> get props => [userId];
}
