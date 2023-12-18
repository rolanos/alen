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
  final String name;
  final String role;

  SignUp(
      {required this.name,
      required this.role,
      required this.email,
      required this.password});
}

class UpdateData extends AuthEvent {
  final String name;
  final String role;

  final Completer? completer;

  UpdateData({required this.name, required this.role, this.completer});
}

class LogOut extends AuthEvent {}
