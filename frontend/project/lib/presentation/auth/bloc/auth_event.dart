part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}
class AuthLoginRequest extends AuthEvent{
  String username;
  String password;
  AuthLoginRequest(this.password,this.username);

}

class AuthRegisterRequest extends AuthEvent{
  String username;
  String email;
  String passwordConfirm;
  String password;
  AuthRegisterRequest(this.email,this.passwordConfirm,this.password,this.username);
}

class LoginButtonPressedEvent extends AuthEvent {}

class RegisterButtonPressedEvent extends AuthEvent {}