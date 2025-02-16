part of 'home_bloc.dart';

class HomeState extends Equatable {
  final HomeStatus status;
  final String message;
  final List<String> contextData;

  const HomeState({
    this.status = HomeStatus.initial,
    this.message = "",
    this.contextData = const [],
  });

  HomeState copyWith({
    HomeStatus? status,
    String? message,
    List<String>? contextData,
  }) {
    return HomeState(
      status: status ?? this.status,
      message: message ?? this.message,
      contextData: contextData ?? this.contextData,
    );
  }

  @override
  List<Object> get props => [
        status,
        message,
        contextData,
      ];
}

enum HomeStatus {
  initial,
  loading,
  success,
  error,
}
