import 'package:housekeeping_pro/configuration/assets/app_icons.dart';
import 'package:housekeeping_pro/features/dashboard/model/entity/dashboard_drawer_tab_model.dart';

class DashboardUtils {
  // Singleton
  static final DashboardUtils _instance = DashboardUtils._internal();

  factory DashboardUtils() => _instance;

  DashboardUtils._internal();

  List<DashboardDrawerTabModel> tabs = [
    DashboardDrawerTabModel(title: 'Dashboard', icon: AppIcons.dashboard),
    DashboardDrawerTabModel(title: 'Inventory', icon: AppIcons.inventory),
    DashboardDrawerTabModel(title: 'Activity Log', icon: AppIcons.orders),
  ];
}
