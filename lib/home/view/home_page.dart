import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housekeeping_pro/common/toast_message/toast_message.dart';
import 'package:housekeeping_pro/common/widgets/state_loader_view.dart';
import 'package:housekeeping_pro/configuration/app_colors/app_colors.dart';
import 'package:housekeeping_pro/configuration/size_config/size_config.dart';
import 'package:housekeeping_pro/features/user_profile/view/user_profile_page.dart';
import 'package:housekeeping_pro/home/view/widgets/home_widget_view.dart';
import 'package:housekeeping_pro/home/view_model/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.isUserFirstTime,
  });

  static const String route = '/home';
  final bool isUserFirstTime;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    crossAxisSpacing: 10.w,
    mainAxisSpacing: 10.h,
    childAspectRatio: 1.5,
  );

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.isUserFirstTime) {
        context.read<HomeBloc>().add(GetHomeContextData());
        return;
      }
      context.read<HomeBloc>().add(GetHomeContextDataFromStorage());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state.status == HomeStatus.error) {
          ToastMessage.show(message: state.message, context: context);
          return;
        }
      },
      builder: (context, state) {
        return Scaffold(
          // drawerEnableOpenDragGesture: true,
          appBar: AppBar(
            title: const Text("Home"),
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
          //Currently drawer is consider for future use
          /* drawer: SafeArea(
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
          ),*/

          body: StateLoaderView(
            isLoading: state.status == HomeStatus.loading,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
              ),
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  GridView.builder(
                    itemCount: state.contextData.length,
                    shrinkWrap: true,
                    gridDelegate: gridDelegate,
                    itemBuilder: (ctx, index) {
                      final item = state.contextData[index];
                      return HomeWidgetView(
                        title: item,
                        onTap: () {},
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
