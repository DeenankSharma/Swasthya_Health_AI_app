import 'dart:async';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project/data/googleSignInAPI.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonClickedEvent>(loginButtonClickedEvent);
  }

  FutureOr<void> loginButtonClickedEvent(LoginButtonClickedEvent event, Emitter<LoginState> emit) {
    GoogleSignInApi.login();
  }
}
