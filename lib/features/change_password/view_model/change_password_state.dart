part of 'change_password_bloc.dart';

final class ChangePasswordState extends Equatable {
  final ChangePasswordStatus status;
  final String message;

  const ChangePasswordState({
    this.status = ChangePasswordStatus.initial,
    this.message = '',
  });

  ChangePasswordState copyWith({
    ChangePasswordStatus? status,
    String? message,
  }) {
    return ChangePasswordState(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [
        status,
        message,
      ];
}

enum ChangePasswordStatus { initial, loading, success, failure }
