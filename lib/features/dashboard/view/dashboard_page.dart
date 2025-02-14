import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housekeeping_pro/configuration/app_colors/app_colors.dart';
import 'package:housekeeping_pro/configuration/size_config/size_config.dart';
import 'package:housekeeping_pro/features/change_password/view/change_password_page.dart';
import 'package:housekeeping_pro/features/dashboard/view/widgets/dashboard_drawer.dart';
import 'package:housekeeping_pro/features/dashboard/view_model/dashboard_bloc.dart';
import 'package:housekeeping_pro/features/user_profile/view/user_profile_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  static const String route = "/dashboard";

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardBloc, DashboardState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          drawerEnableOpenDragGesture: true,
          appBar: AppBar(
            backgroundColor: AppColors.whiteColor,
            title: const Text("Dashboard"),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, UserProfilePage.route);
                },
                icon: Container(
                  padding: EdgeInsets.all(5.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      50.r,
                    ),
                    border: Border.all(
                      color: AppColors.greyColor,
                    ),
                  ),
                  child: Icon(Icons.person),
                ),
              )
            ],
          ),
          drawer: SafeArea(
            child: DashboardDrawer(
              selectedIndex: state.dashboardTabIndex,
              onItemTap: (value) {
                if (value == 3) {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, ChangePasswordPage.route);
                  return;
                }
                Navigator.pop(context);
                context
                    .read<DashboardBloc>()
                    .add(UpdateDashboardTabEvent(value));
              },
            ),
          ),
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(),
          ),
        );
      },
    );
  }
}
