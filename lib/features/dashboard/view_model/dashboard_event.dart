part of 'dashboard_bloc.dart';

sealed class DashboardEvent extends Equatable {
  const DashboardEvent();
}

class UpdateDashboardTabEvent extends DashboardEvent {
  final int index;

  const UpdateDashboardTabEvent(this.index);

  @override
  List<Object> get props => [index];
}
