import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardState()) {
    on<UpdateDashboardTabEvent>(_onUpdateDashboardTabEvent);
  }

  FutureOr<void> _onUpdateDashboardTabEvent(
      UpdateDashboardTabEvent event, Emitter<DashboardState> emit) {
    emit(state.copyWith(dashboardTabIndex: event.index));
  }
}
