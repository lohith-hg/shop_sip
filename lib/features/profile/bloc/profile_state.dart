import 'package:equatable/equatable.dart';

import '../models/user.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object?> get props => [];
}

class ProfileInitialState extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileLoadedState extends ProfileState {
  final AppUser userProfile;

  ProfileLoadedState(this.userProfile);

  @override
  List<Object?> get props => [userProfile];
}

class ProfileErrorState extends ProfileState {
  final String error;

  ProfileErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
