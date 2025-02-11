import 'dart:convert';

import 'package:housekeeping_pro/common/constants/app_messages.dart';
import 'package:housekeeping_pro/networking/network_apis.dart';
import 'package:housekeeping_pro/networking/network_connectivity.dart';
import 'package:housekeeping_pro/networking/network_exception.dart';
import 'package:housekeeping_pro/networking/network_response.dart';
import 'package:housekeeping_pro/storage/local_storage.dart';
import 'package:housekeeping_pro/storage/local_storage_constants.dart';
import 'package:http/http.dart' as http;

class NetworkBaseHelper {
  //Singleton factory
  static final NetworkBaseHelper _networkBaseHelper =
      NetworkBaseHelper._internal();

  factory NetworkBaseHelper() {
    return _networkBaseHelper;
  }

  NetworkBaseHelper._internal();

  final String _baseUrl = NetworkApis.baseUrl;

  //Api Header
  Future<Map<String, String>> getApiHeaders() async {
    final storage = LocalStorage();
    final authToken = storage.getString(key: LocalStorageConstants.authToken);
    final tenantId = storage.getString(key: LocalStorageConstants.tenantId);
    final map = {
      'Content-Type': 'application/json; charset=UTF-8',
      'accept': 'application/json',
      'x-tenant-id': tenantId,
      'authorization': 'Bearer $authToken'
    };
    return map;
  }

  Future<NetworkResponse?> getApi(
      String url, Map<String, String> queryParameters) async {
    var uri = Uri.parse(_baseUrl + url);
    uri = uri.replace(queryParameters: queryParameters);
    final headers = await getApiHeaders();

    final response = await safeApiCall(http.get(
      uri,
      headers: headers,
    ));
    return response;
  }

  Future<NetworkResponse?> postApi(
      {required String urlPath, Map<String, dynamic>? jsonData}) async {
    final headers = await getApiHeaders();
    final body = jsonData != null
        ? jsonData.isNotEmpty
            ? jsonEncode(jsonData)
            : null
        : null;
    final response = await safeApiCall(http.post(
      Uri.parse(_baseUrl + urlPath),
      headers: headers,
      body: body,
    ));
    return response;
  }

  Future<NetworkResponse?> safeApiCall(
      Future<http.Response> apiResponse) async {
    if (await NetworkConnectivity.getInstance().checkConnection()) {
      try {
        final response = await apiResponse.timeout(const Duration(seconds: 60));
        final formattedResponse = _returnResponse(response);
        return NetworkResponse.success(formattedResponse);
      } catch (e) {
        return NetworkResponse.error(e.toString());
      }
    } else {
      return NetworkResponse.error(
        'No internet connection',
      );
    }
  }

  dynamic _returnResponse(http.Response response) {
    final responseJson = jsonDecode(response.body);
    switch (response.statusCode) {
      case 200:
        return responseJson;
      case 400:
        throw BadRequestException(
          responseJson['message'] ?? AppMessages.txtInvalidRequest,
        );
      case 401:
      case 403:
        throw UnauthorisedException(
          responseJson['message'] ?? AppMessages.txtUnauthorised,
        );
      case 500:
        throw InternalServerErrorException(
          responseJson['message'] ?? AppMessages.txtInternalServerException,
        );
      default:
        throw ForbiddenException(
          responseJson['message'] ?? AppMessages.txtForbiddenException,
        );
    }
  }
}
