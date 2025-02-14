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
import 'package:housekeeping_pro/features/authenticaiton/view_model/authentication_bloc.dart';
import 'package:housekeeping_pro/features/dashboard/view/dashboard_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const String route = "/login";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final hotelNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state.loginStatus == AuthStatus.success) {
            Navigator.pushNamedAndRemoveUntil(
                context, DashboardPage.route, (predicate) => false);
            return;
          }
          if (state.loginStatus == AuthStatus.error) {
            ToastMessage.show(message: state.message, context: context);
          }
          if (state.encryptStatus == AuthStatus.error) {
            ToastMessage.show(message: state.message, context: context);
          }
        },
        builder: (context, state) {
          return StateLoaderView(
            isLoading: state.loginStatus == AuthStatus.loading ||
                state.encryptStatus == AuthStatus.loading,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: TextWidget(
                      text: AppStrings.login,
                      color: Colors.white,
                      fontSize: 36.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: Colors.white,
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              text: AppStrings.email,
                              fontSize: 16.sp,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            TextInputField(
                              controller: emailController,
                              validator: FormValidators().validateEmail,
                              hintText: AppStrings.email,
                            ),
                            TextWidget(
                              text: AppStrings.password,
                              fontSize: 16.sp,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            TextInputField(
                              controller: passwordController,
                              obscureText: true,
                              validator: FormValidators().validatePassword,
                              hintText: AppStrings.password,
                            ),
                            TextWidget(
                              text: AppStrings.hotelName,
                              fontSize: 16.sp,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            TextInputField(
                              controller: hotelNameController,
                              hintText: AppStrings.hotelName,
                              validator: FormValidators().validateHotelName,
                            ),
                            Button(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<AuthenticationBloc>().add(
                                        LoginEvent(
                                          email: emailController.text,
                                          password: passwordController.text,
                                          hotelName: hotelNameController.text,
                                        ),
                                      );
                                }
                              },
                              buttonLabel: AppStrings.login,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
