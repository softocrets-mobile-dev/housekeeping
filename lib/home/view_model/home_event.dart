part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();
}

class GetHomeContextData extends HomeEvent {
  const GetHomeContextData();

  @override
  List<Object> get props => [];
}

class GetHomeContextDataFromStorage extends HomeEvent {
  const GetHomeContextDataFromStorage();

  @override
  List<Object> get props => [];
}
