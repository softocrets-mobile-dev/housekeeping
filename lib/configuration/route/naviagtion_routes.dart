import 'package:flutter/material.dart';
import 'package:housekeeping_pro/features/%20dashboard/view/dashboard_page.dart';
import 'package:housekeeping_pro/features/authenticaiton/view/login_page.dart';

class NavigationRoutes {
  factory NavigationRoutes() => _instance;

  NavigationRoutes._internal();

  static final NavigationRoutes _instance = NavigationRoutes._internal();
  static String previousRoute = '';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    previousRoute = settings.name ?? '';
    switch (settings.name) {
      case LoginPage.route:
        return MaterialPageRoute(
          builder: (_) => LoginPage(),
        );
      case DashboardPage.route:
        return MaterialPageRoute(
          builder: (_) => DashboardPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
