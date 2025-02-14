import 'package:housekeeping_pro/networking/network_response.dart';

abstract class ChangePasswordModel {
  Future<NetworkResponse> changePassword({
    required String oldPassword,
    required String newPassword,
  });
}
