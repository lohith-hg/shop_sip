
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../router.dart';
import '../../profile/models/user.dart';
import '../../profile/repository/service_class.dart';
import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final UserService userService = UserService();

  AuthBloc() : super(AuthInitial()) {
    on<SignInWithGoogleEvent>((event, emit) async {
      await _handleGoogleSignIn(emit);
    });

    on<SignOutEvent>((event, emit) async {
      await _handleSignOut(emit);
    });
  }

  _handleGoogleSignIn(Emitter<AuthState> emit) async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();

      if (googleSignInAccount == null) {
        emit(const ErrorState(message: 'Google Sign-In canceled'));
        return;
      }

      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      final User? user = userCredential.user;
      if (user != null) {
        if (userCredential.additionalUserInfo!.isNewUser) {
          var appUser = AppUser();
          appUser.name = googleSignInAccount.displayName;
          appUser.uid = FirebaseAuth.instance.currentUser!.uid;
          appUser.email = googleSignInAccount.email;
          appUser.imageUrl = googleSignInAccount.photoUrl;
          appUser.createdAt = DateTime.now();
          await userService.setUser(appUser);
          emit(AuthenticatedState(user: user));
        } else {}
        router.go('/');
      } else {
        emit(const ErrorState(message: 'Authentication failed'));
      }
    } catch (error) {
      emit(ErrorState(message: error.toString()));
    }
  }

  _handleSignOut(Emitter<AuthState> emit) async {
    try {
      await _googleSignIn.disconnect();
      await _googleSignIn.signOut();
      await _auth.signOut();
      emit(UnauthenticatedState());
      router.go('/auth');
    } catch (error) {
      emit(ErrorState(message: error.toString()));
    }
  }
}
