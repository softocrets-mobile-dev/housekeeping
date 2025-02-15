import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housekeeping_pro/common/utils/user_profile_view_model/user_profile_cubit.dart';
import 'package:housekeeping_pro/configuration/app_theme/app_theme.dart';
import 'package:housekeeping_pro/configuration/route/naviagtion_routes.dart';
import 'package:housekeeping_pro/configuration/size_config/size_config.dart';
import 'package:housekeeping_pro/features/splash/view/splash_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final Size data = MediaQuery.of(context).size;
    SizeConfig.initialize(
      context: context,
      draftWidth: data.width,
      draftHeight: data.height,
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserProfileCubit()
            ..getUserProfileData()
            ..getThemeMode(),
        ),
      ],
      child: BlocBuilder<UserProfileCubit, UserProfileState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Housekeeping',
            theme: state.appTheme == 2
                ? AppTheme.lightThemeMode
                : state.appTheme == 0
                    ? AppTheme.darkThemeMode
                    : AppTheme.lightThemeMode,
            darkTheme: state.appTheme == 2 ? AppTheme.darkThemeMode : null,
            themeMode: state.appTheme == 2 ? ThemeMode.system : null,
            onGenerateRoute: NavigationRoutes.onGenerateRoute,
            home: SplashPage(),
            builder: (context, child) {
              return child!;
            },
          );
        },
      ),
    );
  }
}
