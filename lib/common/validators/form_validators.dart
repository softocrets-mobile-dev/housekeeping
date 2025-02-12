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
}
