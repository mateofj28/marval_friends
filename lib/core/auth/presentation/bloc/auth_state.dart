import '../../domain/models/auth_token.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final AuthToken token;

  AuthSuccess(this.token);
}

class AuthFailure extends AuthState {
  final String message;

  AuthFailure(this.message);
}
