import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthenticatedState extends AuthState {
  final User user;

  const AuthenticatedState({required this.user});

  @override
  List<Object?> get props => [user];
}

class UnauthenticatedState extends AuthState {}

class ErrorState extends AuthState {
  final String message;

  const ErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
