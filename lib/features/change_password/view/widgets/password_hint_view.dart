import 'package:flutter/material.dart';
import 'package:housekeeping_pro/common/constants/app_messages.dart';
import 'package:housekeeping_pro/common/constants/app_strings.dart';
import 'package:housekeeping_pro/common/widgets/text_widget.dart';
import 'package:housekeeping_pro/configuration/size_config/size_config.dart';

class PasswordHintView extends StatefulWidget {
  const PasswordHintView({super.key});

  @override
  State<PasswordHintView> createState() => _PasswordHintViewState();
}

class _PasswordHintViewState extends State<PasswordHintView> {
  final List<String> hintPassword = [
    AppMessages.txtPasswordHintUpperCase,
    AppMessages.txtPasswordHintLowerCase,
    AppMessages.txtPasswordHintDigit,
    AppMessages.txtPasswordHintSpecialChar,
    AppMessages.txtPasswordHintLength,
  ];
  bool isHintShow = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(10.r),
            onTap: () {
              setState(() {
                isHintShow = !isHintShow;
              });
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    color: Colors.blueAccent,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  TextWidget(
                    text: AppStrings.passwordHint,
                    fontSize: 16.sp,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
          ),
          if (isHintShow)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5.h,
                ),
                TextWidget(
                  text: AppMessages.txtPasswordHint,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Column(
                  children: hintPassword
                      .map(
                        (hint) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              //only dot
                              TextWidget(
                                text: "•",
                                fontSize: 16.sp,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              TextWidget(
                                text: hint,
                                fontSize: 16.sp,
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
