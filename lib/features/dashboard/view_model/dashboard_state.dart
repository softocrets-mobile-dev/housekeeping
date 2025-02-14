part of 'dashboard_bloc.dart';

final class DashboardState extends Equatable {
  final int dashboardTabIndex;

  const DashboardState({
    this.dashboardTabIndex = 0,
  });

  DashboardState copyWith({
    int? dashboardTabIndex,
  }) {
    return DashboardState(
      dashboardTabIndex: dashboardTabIndex ?? this.dashboardTabIndex,
    );
  }

  @override
  List<Object> get props => [
        dashboardTabIndex,
      ];
}
