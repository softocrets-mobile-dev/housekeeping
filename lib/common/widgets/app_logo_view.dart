import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:housekeeping_pro/common/utils/user_profile_view_model/user_profile_cubit.dart';
import 'package:housekeeping_pro/configuration/app_theme/extension/image_theme_data_extension.dart';
import 'package:housekeeping_pro/configuration/assets/app_images.dart';

class AppLogoView extends StatelessWidget {
  const AppLogoView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeExtension =
        Theme.of(context).extension<ImageThemeDataExtension>()!;
    return BlocBuilder<UserProfileCubit, UserProfileState>(
      builder: (context, state) {
        return Center(
          child: SvgPicture.asset(
            width: MediaQuery.of(context).size.width * 0.8,
            AppImages.logo,
            colorFilter: ColorFilter.mode(
              themeExtension.color,
              BlendMode.srcIn,
            ),
          ),
        );
      },
    );
  }
}
