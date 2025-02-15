import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housekeeping_pro/common/constants/app_strings.dart';
import 'package:housekeeping_pro/common/utils/user_profile_view_model/user_profile_cubit.dart';
import 'package:housekeeping_pro/common/widgets/text_widget.dart';
import 'package:housekeeping_pro/configuration/size_config/size_config.dart';

class AppThemeDialogView extends StatefulWidget {
  const AppThemeDialogView({
    super.key,
    required this.themeMode,
  });

  final int themeMode;

  @override
  State<AppThemeDialogView> createState() => _AppThemeDialogViewState();
}

class _AppThemeDialogViewState extends State<AppThemeDialogView> {
  var intThemeMode = 0;

  @override
  void initState() {
    intThemeMode = widget.themeMode;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  text: AppStrings.appTheme,
                  fontSize: 18.sp,
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.close),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 3.w,
            ),
            child: Divider(
              color: Colors.grey,
              height: 0,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          RadioListTile(
            value: 0,
            selected: widget.themeMode == 0,
            groupValue: intThemeMode,
            onChanged: (v) {
              context.read<UserProfileCubit>().updateAppTheme(themeMode: 0);
              setState(() {
                intThemeMode = 0;
              });
            },
            toggleable: true,
            title: TextWidget(
              text: AppStrings.darkTheme,
            ),
          ),
          RadioListTile(
            value: 1,
            groupValue: intThemeMode,
            selected: widget.themeMode == 1,
            onChanged: (v) {
              context.read<UserProfileCubit>().updateAppTheme(themeMode: 1);
              setState(() {
                intThemeMode = 1;
              });
            },
            toggleable: true,
            title: TextWidget(
              text: AppStrings.lightTheme,
            ),
          ),
          RadioListTile(
            value: 2,
            groupValue: intThemeMode,
            selected: widget.themeMode == 2,
            onChanged: (v) {
              context.read<UserProfileCubit>().updateAppTheme(themeMode: 2);
              setState(() {
                intThemeMode = 2;
              });
            },
            toggleable: true,
            title: TextWidget(
              text: AppStrings.systemTheme,
            ),
          ),
        ],
      ),
    );
  }
}
