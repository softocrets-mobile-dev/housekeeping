import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housekeeping_pro/features/authenticaiton/view/login_page.dart';
import 'package:housekeeping_pro/features/change_password/view/change_password_page.dart';
import 'package:housekeeping_pro/features/change_password/view_model/change_password_bloc.dart';
import 'package:housekeeping_pro/features/dashboard/view/dashboard_page.dart';
import 'package:housekeeping_pro/features/dashboard/view_model/dashboard_bloc.dart';
import 'package:housekeeping_pro/features/user_profile/view/user_profile_page.dart';

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
      case ChangePasswordPage.route:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => ChangePasswordBloc(),
            child: ChangePasswordPage(),
          ),
        );
      case UserProfilePage.route:
        return MaterialPageRoute(
          builder: (_) => UserProfilePage(),
        );
      case DashboardPage.route:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => DashboardBloc(),
            child: DashboardPage(),
          ),
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
