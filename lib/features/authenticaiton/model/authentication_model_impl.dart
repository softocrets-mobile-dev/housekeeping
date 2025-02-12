import 'package:housekeeping_pro/features/authenticaiton/model/authentication_model.dart';
import 'package:housekeeping_pro/features/authenticaiton/model/entity/auth_login_response_data_model.dart';
import 'package:housekeeping_pro/networking/network_apis.dart';
import 'package:housekeeping_pro/networking/network_base_helper.dart';
import 'package:housekeeping_pro/networking/network_response.dart';

class AuthenticationModelImpl implements AuthenticationModel {
  final NetworkBaseHelper helper = NetworkBaseHelper();

  @override
  Future<NetworkResponse<AuthLoginResponseDataModel>> login({
    required String email,
    required String password,
    required String hotelName,
  }) async {
    try {
      final response =
          await helper.postApi(urlPath: NetworkApis.login, jsonData: {
        'email': email,
        'password': password,
        'hotelName': hotelName,
      });
      if (response != null) {
        if (response.statusCode == 200) {
          final data = AuthLoginResponseDataModel.fromJson(response.data);
          return NetworkResponse<AuthLoginResponseDataModel>.success(data,
              statusCode: response.statusCode);
        } else {
          return NetworkResponse.error(response.message ?? "",
              statusCode: response.statusCode);
        }
      } else {
        return NetworkResponse.error(
          "Something went wrong",
          statusCode: response?.statusCode ?? 500,
        );
      }
    } catch (e) {
      return NetworkResponse.error(
        e.toString(),
      );
    }
  }

  @override
  Future<NetworkResponse> updatePassword({
    required String oldPassword,
    required String newPassword,
  }) {
    // TODO: implement updatePassword
    throw UnimplementedError();
  }

  @override
  Future<NetworkResponse<String>> encryptSecurePassword(
      {required String password}) async {
    try {
      final response = await helper
          .getApi('${NetworkApis.encryptionPassword}/$password', {});
      if (response != null) {
        if (response.statusCode == 200) {
          return response.data;
        } else {
          return NetworkResponse.error(response.message ?? "",
              statusCode: response.statusCode);
        }
      } else {
        NetworkResponse.error(
          "Something went wrong",
        );
      }
    } catch (e) {
      return NetworkResponse.error(
        e.toString(),
      );
    }
    return NetworkResponse.error(
      "Something went wrong",
    );
  }
}
