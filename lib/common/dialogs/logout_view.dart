import 'package:flutter/material.dart';
import 'package:housekeeping_pro/common/constants/app_messages.dart';
import 'package:housekeeping_pro/common/constants/app_strings.dart';
import 'package:housekeeping_pro/common/widgets/button.dart';
import 'package:housekeeping_pro/common/widgets/text_widget.dart';
import 'package:housekeeping_pro/configuration/size_config/size_config.dart';

class LogoutView extends StatelessWidget {
  const LogoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        decoration: BoxDecoration(),
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              text: AppStrings.loggingOut,
              fontSize: 24.sp,
            ),
            SizedBox(height: 20.h),
            TextWidget(
              text: AppMessages.logoutConfirmationMessage,
              fontSize: 16.sp,
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(5.r),
                  onTap: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
                    child: TextWidget(
                      text: AppStrings.cancel,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints.tightFor(width: 100.w),
                  child: Button(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    buttonLabel: AppStrings.logout,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
