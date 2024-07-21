import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:meta/meta.dart';
import 'package:project/data/repositories/auth_repo.dart';
import 'package:project/gitit/gitit.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository _authrepository = locator.get();
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequest>(authLoginRequest);
    on<AuthRegisterRequest>(authRegisterRequest);
    on<LoginButtonPressedEvent>(loginButtonPressedEvent);
    on<RegisterButtonPressedEvent>(registerButtonPressedEvent);
  }

  FutureOr<void> authLoginRequest(AuthLoginRequest event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    var login = await _authrepository.login(event.username, event.password);
    emit(AuthRequestSuccessState(login));
  } 

  FutureOr<void> authRegisterRequest(event, Emitter<AuthState> emit) async{
    emit(AuthLoadingState());
    var register = await _authrepository.register(event.email, event.password, event.confirmPassword, event.name);
    emit(AuthRequestSuccessState(register));
  }

  FutureOr<void> loginButtonPressedEvent(LoginButtonPressedEvent event, Emitter<AuthState> emit) {
    emit(AuthLoginState());
  }

  FutureOr<void> registerButtonPressedEvent(RegisterButtonPressedEvent event, Emitter<AuthState> emit) {
    emit(AuthRegisterState());
  }
}
