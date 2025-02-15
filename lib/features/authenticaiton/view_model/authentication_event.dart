part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}

class LoginEvent extends AuthenticationEvent {
  final String email;
  final String password;
  final String hotelName;

  const LoginEvent({
    required this.email,
    required this.password,
    required this.hotelName,
  });

  @override
  List<Object> get props => [
        email,
        password,
        hotelName,
      ];
}

class UpdatePasswordEvent extends AuthenticationEvent {
  final String oldPassword;
  final String newPassword;

  const UpdatePasswordEvent({
    required this.oldPassword,
    required this.newPassword,
  });

  @override
  List<Object> get props => [
        oldPassword,
        newPassword,
      ];
}

class LogoutEvent extends AuthenticationEvent {
  const LogoutEvent();

  @override
  List<Object> get props => [];
}

//Save the user data in the local storage
class SaveUserDataEvent extends AuthenticationEvent {
  const SaveUserDataEvent({
    required this.data,
  });

  final AuthLoginResponseDataModel data;

  @override
  List<Object> get props => [
        data,
      ];
}

class UpdateRememberMeStatus extends AuthenticationEvent {
  const UpdateRememberMeStatus();

  @override
  List<Object> get props => [];
}
