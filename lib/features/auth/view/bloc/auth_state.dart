part of 'auth_bloc.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthEmpty extends AuthState {}

class AuthLoading extends AuthState {}

class AuthError extends AuthState {}

class AuthSuccess extends AuthState {
  final String email;
  final String password;

  AuthSuccess({required this.email, required this.password});
}
