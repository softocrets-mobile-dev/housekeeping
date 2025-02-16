import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:housekeeping_pro/common/widgets/text_widget.dart';
import 'package:housekeeping_pro/configuration/app_colors/app_colors.dart';
import 'package:housekeeping_pro/configuration/assets/app_icons.dart';
import 'package:housekeeping_pro/configuration/size_config/size_config.dart';

class HomeWidgetView extends StatelessWidget {
  const HomeWidgetView({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10.r),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.textFieldBgColor,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: AppColors.greyColor,
          ),
        ),
        constraints: BoxConstraints(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              getIcon(
                iconName: title,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            TextWidget(
              text: title,
              color: AppColors.blackColor,
            )
          ],
        ),
      ),
    );
  }

  String getIcon({String iconName = ''}) {
    switch (iconName.toLowerCase()) {
      case 'activity':
        return AppIcons.orders;
      case 'inventory':
        return AppIcons.inventory;
      case 'dashboard':
        return AppIcons.dashboard;
      default:
        return AppIcons.orders;
    }
  }
}
