import 'package:housekeeping_pro/common/constants/app_messages.dart';

class FormValidators {
  factory FormValidators() {
    return _singleton;
  }

  static final FormValidators _singleton = FormValidators._internal();

  FormValidators._internal();

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return AppMessages.txtEnterEmail;
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return AppMessages.txtInvalidEmailFormat;
    }
    if (value.contains(' ')) {
      return AppMessages.txtEmailCannotContainSpaces;
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return AppMessages.txtEnterPassword;
    }
    return null;
  }

  String? validateHotelName(String? value) {
    if (value == null || value.isEmpty) {
      return AppMessages.txtEnterHotelName;
    }
    return null;
  }

  String? validateStrictPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a new password';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least 1 uppercase letter';
    }

    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain at least 1 lowercase letter';
    }

    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least 1 digit';
    }

    if (!value.contains(RegExp(r'[!@#$%^&*()]'))) {
      return 'Password must contain at least 1 special character (!@#\$%^&*())';
    }

    return null; // No error, validation passed
  }

  String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Confirm password is required';
    }

    if (value != password) {
      return 'Passwords do not match';
    }
    return null; // No error, validation passed
  }
}
