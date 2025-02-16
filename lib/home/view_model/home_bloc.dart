import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housekeeping_pro/home/model/home_model_impl.dart';
import 'package:housekeeping_pro/storage/local_storage.dart';
import 'package:housekeeping_pro/storage/local_storage_constants.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeModelImpl homeModelImpl = HomeModelImpl();

  HomeBloc() : super(HomeState()) {
    on<GetHomeContextData>(_onGetHomeContextData);
    on<GetHomeContextDataFromStorage>(_onGetHomeContextDataFromStorage);
  }

  FutureOr<void> _onGetHomeContextData(
    GetHomeContextData event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomeStatus.loading));
    try {
      final homeData = await homeModelImpl.getAppContextData();
      if (homeData.statusCode == 200) {
        await LocalStorage.getInstance().saveStringList(
          key: LocalStorageConstants.homeContextData,
          value: homeData.data ?? [],
        );
        emit(state.copyWith(
          status: HomeStatus.success,
          contextData: homeData.data,
        ));
      } else {
        emit(state.copyWith(
            status: HomeStatus.error, message: homeData.message));
      }
    } catch (e) {
      emit(state.copyWith(status: HomeStatus.error));
    }
  }

  FutureOr<void> _onGetHomeContextDataFromStorage(
    GetHomeContextDataFromStorage event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomeStatus.loading));
    try {
      final contextData = await LocalStorage.getInstance().getStringList(
        key: LocalStorageConstants.homeContextData,
      );
      emit(state.copyWith(
        status: HomeStatus.success,
        contextData: contextData,
      ));
    } catch (e) {
      emit(state.copyWith(status: HomeStatus.error));
    }
  }
}
