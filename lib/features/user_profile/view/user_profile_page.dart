import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:housekeeping_pro/common/constants/app_strings.dart';
import 'package:housekeeping_pro/common/dialogs/app_theme_dialog_view.dart';
import 'package:housekeeping_pro/common/dialogs/logout_view.dart';
import 'package:housekeeping_pro/common/toast_message/toast_message.dart';
import 'package:housekeeping_pro/common/utils/user_profile_view_model/user_profile_cubit.dart';
import 'package:housekeeping_pro/common/widgets/text_widget.dart';
import 'package:housekeeping_pro/configuration/assets/app_icons.dart';
import 'package:housekeeping_pro/configuration/size_config/size_config.dart';
import 'package:housekeeping_pro/features/authenticaiton/view/login_page.dart';
import 'package:housekeeping_pro/features/change_password/view/change_password_page.dart';
import 'package:housekeeping_pro/features/user_profile/view/widgets/user_profile_button_view.dart';
import 'package:housekeeping_pro/storage/local_storage_constants.dart';

import '../../../storage/local_storage.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  static const String route = "/user_profile";

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  void initState() {
    Future.microtask(() async {
      context.read<UserProfileCubit>().getUserProfileData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserProfileCubit, UserProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const TextWidget(text: " Profile"),
          ),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                SvgPicture.asset(
                  AppIcons.person,
                  height: 100.h,
                  width: 100.w,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextWidget(
                      text: state.name,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                    TextWidget(
                      text: state.email,
                      overflow: TextOverflow.ellipsis,
                    ),
                    TextWidget(
                      text: state.hotelName,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                UserProfileButtonView(
                  onTap: () {
                    Navigator.pushNamed(context, ChangePasswordPage.route);
                  },
                  title: AppStrings.changePassword,
                ),
                SizedBox(
                  height: 10.h,
                ),
                UserProfileButtonView(
                  onTap: () async {
                    final themeMode =
                        context.read<UserProfileCubit>().state.appTheme;
                    await showAdaptiveDialog<bool>(
                      context: context,
                      builder: (ctx) {
                        return AppThemeDialogView(
                          themeMode: themeMode,
                        );
                      },
                    );
                  },
                  title: AppStrings.appTheme,
                ),
                SizedBox(
                  height: 10.h,
                ),
                UserProfileButtonView(
                  onTap: () async {
                    await showAdaptiveDialog<bool>(
                      context: context,
                      builder: (ctx) {
                        return LogoutView();
                      },
                    ).then((v) async {
                      final isRememberMe = await LocalStorage.getInstance()
                          .getBool(key: LocalStorageConstants.isRememberMe);
                      if (v == null || !v) return;
                      try {
                        if (!isRememberMe) {
                          await LocalStorage.getInstance().clearAll();
                        }
                        if (isRememberMe) {
                          await LocalStorage.getInstance()
                              .clearIsRememberData();
                        }
                        if (context.mounted) {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              LoginPage.route, (route) => false);
                        }
                      } catch (e) {
                        if (context.mounted) {
                          ToastMessage.show(
                              message: e.toString(), context: context);
                        }
                      }
                    });
                  },
                  title: AppStrings.logout,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
