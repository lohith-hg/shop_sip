import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/user.dart';
import '../repository/service_class.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UserService userService = UserService();

  ProfileBloc() : super(ProfileInitialState()) {
    on<FetchUserProfileEvent>((event, emit) async {
      await _handleUserProfile(event, emit);
    });
  }

  Future<void> _handleUserProfile(
      FetchUserProfileEvent event, Emitter<ProfileState> emit) async {
    try {
      final AppUser userProfile =
          await userService.getUser(userId: event.userId) ?? AppUser();
      emit(ProfileLoadedState(userProfile));
    } catch (error) {
      emit(ProfileErrorState(error.toString()));
    }
  }
}
