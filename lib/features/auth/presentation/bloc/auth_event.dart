part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class CheckLoginStatusEvent extends AuthEvent {}

class LoginWithMicrosoftEvent extends AuthEvent {
  final String code;
  LoginWithMicrosoftEvent(this.code);
}

class LogoutEvent extends AuthEvent {}
