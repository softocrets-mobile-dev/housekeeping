import 'package:flutter/material.dart';
import 'package:housekeeping_pro/configuration/size_config/size_config.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.onPressed,
    this.color,
    required this.buttonLabel,
    this.textColor,
    this.fontWeight = FontWeight.normal,
  });

  final VoidCallback onPressed;
  final Color? color;
  final String buttonLabel;
  final Color? textColor;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: color,
        minimumSize: Size(double.infinity, 50.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
      child: Text(
        buttonLabel,
        style: TextStyle(
          color: textColor,
          fontSize: 16.sp,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
