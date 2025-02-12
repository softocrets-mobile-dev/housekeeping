import 'package:flutter/material.dart';
import 'package:housekeeping_pro/configuration/assets/app_images.dart';
import 'package:housekeeping_pro/features/authenticaiton/view/login_page.dart';
import 'package:housekeeping_pro/features/dashboard/view/dashboard_page.dart';
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
            Navigator.pushReplacementNamed(context, DashboardPage.route);
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
      backgroundColor: Colors.black,
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Image.asset(
          AppImages.logo,
          color: Colors.white,
          colorBlendMode: BlendMode.color,
        ),
      ),
    );
  }
}
