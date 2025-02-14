import 'package:housekeeping_pro/common/constants/app_messages.dart';
import 'package:housekeeping_pro/features/change_password/model/change_password_model.dart';
import 'package:housekeeping_pro/networking/network_apis.dart';
import 'package:housekeeping_pro/networking/network_base_helper.dart';
import 'package:housekeeping_pro/networking/network_response.dart';

class ChangePasswordImpl implements ChangePasswordModel {
  final NetworkBaseHelper helper = NetworkBaseHelper();

  @override
  Future<NetworkResponse> changePassword(
      {required String oldPassword, required String newPassword}) async {
    try {
      final response =
          await helper.postApi(urlPath: NetworkApis.updatePassword, jsonData: {
        'currentPassword': oldPassword,
        'newPassword': newPassword,
      });
      if (response != null) {
        if (response.statusCode == 200) {
          return NetworkResponse.success(
            true,
            statusCode: response.statusCode,
            message: AppMessages.passwordChangedSuccessfully,
          );
        } else {
          return NetworkResponse.error(
            response.message ?? "",
            statusCode: response.statusCode,
          );
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
}
