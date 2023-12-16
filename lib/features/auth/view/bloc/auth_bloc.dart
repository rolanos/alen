import 'dart:developer';

import 'package:alen/features/auth/data/repository/auth_repository_impl.dart';
import 'package:alen/features/auth/domain/repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepository authRepository = AuthRepositoryImpl();

  AuthBloc() : super(AuthInitial()) {
    on<Init>((event, emit) async {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? email = preferences.getString('email');
      String? password = preferences.getString('password');
      if (email != null && password != null) {
        emit(AuthSuccess(email: email, password: password));
      } else {
        emit(AuthEmpty());
      }
    });
    on<SignIn>((event, emit) async {
      emit(AuthLoading());
      try {
        await authRepository.signIn(event.email, event.password);
        emit(
          AuthSuccess(
            email: event.email.trim(),
            password: event.password.trim(),
          ),
        );
      } catch (e) {
        log(e.toString());
        emit(AuthError());
      }
    });
    on<SignUp>((event, emit) async {
      emit(AuthLoading());
      try {
        await authRepository.signUp(event.email, event.password);
        emit(
          AuthSuccess(
            email: event.email.trim(),
            password: event.password.trim(),
          ),
        );
      } catch (e) {
        log(e.toString());
        emit(AuthError());
      }
    });
  }
}
