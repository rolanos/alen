part of 'auth_bloc.dart';

abstract class AuthEvent {}

class Init extends AuthEvent {}

class SignIn extends AuthEvent {
  final String email;
  final String password;

  SignIn({required this.email, required this.password});
}

class SignUp extends AuthEvent {
  final String email;
  final String password;

  SignUp({required this.email, required this.password});
}
