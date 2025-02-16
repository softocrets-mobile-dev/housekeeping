import 'package:flutter/material.dart';
import 'package:housekeeping_pro/common/widgets/app_logo_view.dart';
import 'package:housekeeping_pro/features/authenticaiton/view/login_page.dart';
import 'package:housekeeping_pro/home/view/home_page.dart';
import 'package:housekeeping_pro/storage/local_storage.dart';
import 'package:housekeeping_pro/storage/local_storage_constants.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.microtask(() async {
      final loginStatus = await LocalStorage.getInstance()
          .getBool(key: LocalStorageConstants.isUserLoggedIn);

      if (loginStatus) {
        Future.delayed(const Duration(seconds: 2), () async {
          if (mounted) {
            Navigator.pushReplacementNamed(
              context,
              HomePage.route,
              arguments: false,
            );
          }
        });
        return;
      }
      Future.delayed(const Duration(seconds: 2), () async {
        if (mounted) {
          Navigator.pushReplacementNamed(context, LoginPage.route);
        }
      });
      return;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppLogoView(),
    );
  }
}
