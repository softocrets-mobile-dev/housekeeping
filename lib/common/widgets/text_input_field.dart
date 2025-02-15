import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:housekeeping_pro/configuration/size_config/size_config.dart';

class TextInputField extends StatefulWidget {
  const TextInputField({
    super.key,
    this.controller,
    this.label,
    this.hintText,
    this.leading,
    this.bottomPadding,
    this.obscureText = false,
    this.textInputType,
    this.textInputAction,
    this.showVisibilityIcon = false,
    this.onTextChanged,
    this.autoValidateMode,
    this.validator,
    this.enabled,
    this.onTap,
    this.textInputFormatters,
    this.maxLength,
    this.maxLines = 1,
    this.showCounterText = false,
    this.suffixIcon,
  });

  final TextEditingController? controller;
  final String? label;
  final String? hintText;
  final Widget? leading;
  final double? bottomPadding;
  final bool obscureText;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final bool showVisibilityIcon;
  final int? maxLength;
  final List<TextInputFormatter>? textInputFormatters;
  final Function(String value)? onTextChanged;
  final AutovalidateMode? autoValidateMode;
  final String? Function(String? value)? validator;
  final bool? enabled;
  final VoidCallback? onTap;
  final int maxLines;
  final bool showCounterText;
  final IconData? suffixIcon;

  @override
  State<TextInputField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<TextInputField> {
  late bool _passwordVisible;

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: widget.bottomPadding ?? 18.h),
      child: InkWell(
        onTap: widget.onTap,
        child: TextFormField(
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.sp,
          ),
          controller: widget.controller,
          onChanged: widget.onTextChanged,
          enabled: widget.enabled,
          inputFormatters: widget.textInputFormatters,
          autovalidateMode: widget.autoValidateMode,
          validator: widget.validator,
          enableInteractiveSelection: true,
          maxLength: widget.maxLength,
          obscureText: widget.obscureText
              ? !_passwordVisible
                  ? true
                  : false
              : false,
          keyboardType: widget.textInputType,
          textInputAction: widget.textInputAction,
          maxLines: widget.obscureText ? 1 : widget.maxLines,
          minLines: 1,
          decoration: InputDecoration(
            hintText: widget.hintText,
            suffixIcon: widget.obscureText
                ? IconButton(
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  )
                : widget.suffixIcon != null
                    ? Icon(widget.suffixIcon)
                    : null,
          ),
        ),
      ),
    );
  }
}
