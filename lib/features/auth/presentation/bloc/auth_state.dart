part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

/// Aplikacja startuje – jeszcze nie wiemy czy user jest zalogowany
final class AuthInitial extends AuthState {}

/// Proces logowania / sprawdzania stanu trwa
final class AuthLoading extends AuthState {}

/// Użytkownik jest poprawnie zalogowany
final class AuthLoggedIn extends AuthState {
  final String token;
  AuthLoggedIn(this.token);
}

/// Użytkownik nie jest zalogowany
final class AuthLoggedOut extends AuthState {}

/// Wystąpił błąd (np. podczas logowania)
final class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}
