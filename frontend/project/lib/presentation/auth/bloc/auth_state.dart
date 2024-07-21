part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
class AuthInitState extends AuthState{

}
class AuthLoadingState extends AuthState{
  
}

class AuthRequestSuccessState extends AuthState{
  Either<String,String> response;
  AuthRequestSuccessState(this.response);

}

class AuthLoginState extends AuthState {}

class AuthRegisterState extends AuthState {}