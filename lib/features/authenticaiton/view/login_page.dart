import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housekeeping_pro/common/constants/app_messages.dart';
import 'package:housekeeping_pro/common/constants/app_strings.dart';
import 'package:housekeeping_pro/common/toast_message/toast_message.dart';
import 'package:housekeeping_pro/common/validators/form_validators.dart';
import 'package:housekeeping_pro/common/widgets/app_logo_view.dart';
import 'package:housekeeping_pro/common/widgets/button.dart';
import 'package:housekeeping_pro/common/widgets/state_loader_view.dart';
import 'package:housekeeping_pro/common/widgets/text_input_field.dart';
import 'package:housekeeping_pro/common/widgets/text_widget.dart';
import 'package:housekeeping_pro/configuration/size_config/size_config.dart';
import 'package:housekeeping_pro/features/authenticaiton/view_model/authentication_bloc.dart';
import 'package:housekeeping_pro/features/dashboard/view/dashboard_page.dart';
import 'package:housekeeping_pro/storage/local_storage.dart';
import 'package:housekeeping_pro/storage/local_storage_constants.dart';

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
  void initState() {
    Future.microtask(
      () async {
        final isRememberMe = await LocalStorage.getInstance()
            .getBool(key: LocalStorageConstants.isRememberMe);
        if (isRememberMe) {
          final email = await LocalStorage.getInstance()
              .getString(key: LocalStorageConstants.userEmail);
          final hotelName = await LocalStorage.getInstance()
              .getString(key: LocalStorageConstants.hotelName);
          emailController.text = email;
          hotelNameController.text = hotelName;
          if (mounted) {
            context.read<AuthenticationBloc>().add(UpdateRememberMeStatus());
          }
          setState(() {});
        }
      },
    );
    super.initState();
  }

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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 100.h,
                  ),
                  AppLogoView(),
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 55.w),
                      child: TextWidget(
                        text: AppMessages.loginScreenMessage,
                        textAlign: TextAlign.center,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    margin: EdgeInsets.only(top: 40.h),
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
                            height: 1.h,
                          ),
                          TextInputField(
                            controller: emailController,
                            validator: FormValidators().validateEmail,
                            hintText: AppStrings.email,
                            suffixIcon: Icons.email,
                          ),
                          TextWidget(
                            text: AppStrings.password,
                            fontSize: 16.sp,
                          ),
                          SizedBox(
                            height: 1.h,
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
                            height: 1.h,
                          ),
                          TextInputField(
                            controller: hotelNameController,
                            hintText: AppStrings.hotelName,
                            validator: FormValidators().validateHotelName,
                          ),
                          InkWell(
                            onTap: () => context
                                .read<AuthenticationBloc>()
                                .add(UpdateRememberMeStatus()),
                            child: Row(
                              spacing: 10.w,
                              children: [
                                SizedBox(
                                  height: 20.h,
                                  width: 20.w,
                                  child: Checkbox(
                                    value: state.isRememberMe,
                                    onChanged: (v) {
                                      context
                                          .read<AuthenticationBloc>()
                                          .add(UpdateRememberMeStatus());
                                    },
                                  ),
                                ),
                                TextWidget(
                                  text: AppStrings.rememberMe,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
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
                            buttonLabel: AppStrings.login.toUpperCase(),
                            fontWeight: FontWeight.bold,
                          ),
                        ],
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
