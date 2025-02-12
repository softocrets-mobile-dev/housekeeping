part of 'authentication_bloc.dart';

final class AuthenticationState extends Equatable {
  final AuthStatus loginStatus;
  final AuthStatus encryptStatus;
  final String message;

  const AuthenticationState({
    this.loginStatus = AuthStatus.initial,
    this.encryptStatus = AuthStatus.initial,
    this.message = '',
  });

  AuthenticationState copyWith({
    AuthStatus? loginStatus,
    String? message,
    AuthStatus? encryptStatus,
  }) {
    return AuthenticationState(
      loginStatus: loginStatus ?? this.loginStatus,
      message: message ?? this.message,
      encryptStatus: encryptStatus ?? this.encryptStatus,
    );
  }

  @override
  List<Object> get props => [
        loginStatus,
        message,
        encryptStatus,
      ];
}

enum AuthStatus {
  initial,
  loading,
  success,
  error,
}
