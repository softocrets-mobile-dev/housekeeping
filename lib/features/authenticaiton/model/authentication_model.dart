import 'package:housekeeping_pro/features/authenticaiton/model/entity/auth_login_response_data_model.dart';
import 'package:housekeeping_pro/networking/network_response.dart';

abstract class AuthenticationModel {
  Future<NetworkResponse<AuthLoginResponseDataModel>> login(
      {required String email,
      required String password,
      required String hotelName});

  Future<NetworkResponse> updatePassword({
    required String oldPassword,
    required String newPassword,
  });

  Future<NetworkResponse> encryptSecurePassword({required String password});
}
