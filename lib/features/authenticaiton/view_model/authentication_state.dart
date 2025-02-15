part of 'authentication_bloc.dart';

final class AuthenticationState extends Equatable {
  final AuthStatus loginStatus;
  final AuthStatus encryptStatus;
  final String message;

  final bool isRememberMe;

  const AuthenticationState({
    this.loginStatus = AuthStatus.initial,
    this.encryptStatus = AuthStatus.initial,
    this.isRememberMe = false,
    this.message = '',
  });

  AuthenticationState copyWith({
    AuthStatus? loginStatus,
    String? message,
    AuthStatus? encryptStatus,
    bool? isRememberMe,
  }) {
    return AuthenticationState(
      loginStatus: loginStatus ?? this.loginStatus,
      message: message ?? this.message,
      encryptStatus: encryptStatus ?? this.encryptStatus,
      isRememberMe: isRememberMe ?? this.isRememberMe,
    );
  }

  @override
  List<Object> get props => [
        loginStatus,
        message,
        encryptStatus,
        isRememberMe,
      ];
}

enum AuthStatus {
  initial,
  loading,
  success,
  error,
}
