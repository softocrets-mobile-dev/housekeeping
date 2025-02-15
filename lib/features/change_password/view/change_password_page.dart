import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housekeeping_pro/common/constants/app_strings.dart';
import 'package:housekeeping_pro/common/toast_message/toast_message.dart';
import 'package:housekeeping_pro/common/validators/form_validators.dart';
import 'package:housekeeping_pro/common/widgets/button.dart';
import 'package:housekeeping_pro/common/widgets/state_loader_view.dart';
import 'package:housekeeping_pro/common/widgets/text_input_field.dart';
import 'package:housekeeping_pro/common/widgets/text_widget.dart';
import 'package:housekeeping_pro/configuration/size_config/size_config.dart';
import 'package:housekeeping_pro/features/change_password/view/widgets/password_hint_view.dart';
import 'package:housekeeping_pro/features/change_password/view_model/change_password_bloc.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  static const String route = "/change-password";

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          text: AppStrings.changePassword,
        ),
      ),
      body: BlocConsumer<ChangePasswordBloc, ChangePasswordState>(
        listener: (context, state) {
          if (state.status == ChangePasswordStatus.success) {
            ToastMessage.show(message: state.message, context: context);
            Navigator.pop(context);
          }
          if (state.status == ChangePasswordStatus.failure) {
            ToastMessage.show(message: state.message, context: context);
            return;
          }
        },
        builder: (context, state) {
          return StateLoaderView(
            isLoading: state.status == ChangePasswordStatus.loading,
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      TextWidget(
                        text: AppStrings.oldPassword,
                        fontSize: 16.sp,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      TextInputField(
                        controller: _oldPasswordController,
                        validator: FormValidators().validatePassword,
                        hintText: AppStrings.oldPassword,
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        obscureText: true,
                      ),
                      TextWidget(
                        text: AppStrings.newPassword,
                        fontSize: 16.sp,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      TextInputField(
                        controller: _newPasswordController,
                        validator: FormValidators().validateStrictPassword,
                        hintText: AppStrings.newPassword,
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        obscureText: true,
                      ),
                      TextWidget(
                        text: AppStrings.confirmPassword,
                        fontSize: 16.sp,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      TextInputField(
                        controller: _confirmPasswordController,
                        obscureText: true,
                        validator: (v) {
                          return FormValidators().validateConfirmPassword(
                            v,
                            _newPasswordController.text,
                          );
                        },
                        hintText: AppStrings.confirmPassword,
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      PasswordHintView(),
                      SizedBox(
                        height: 20.h,
                      ),
                      Button(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<ChangePasswordBloc>().add(
                                  ChangePassword(
                                    oldPassword: _oldPasswordController.text,
                                    newPassword: _newPasswordController.text,
                                  ),
                                );
                          }
                        },
                        buttonLabel: AppStrings.changePassword,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
