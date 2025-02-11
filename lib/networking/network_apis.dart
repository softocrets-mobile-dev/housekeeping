import 'package:housekeeping_pro/env/env.dart';

class NetworkApis {
  static final NetworkApis _networkApis = NetworkApis._internal();

  factory NetworkApis() {
    return _networkApis;
  }

  NetworkApis._internal();

  static String baseUrl = Env.baseUrl;

  static const String login = "/app/auth/login";
  static const String updatePassword = "app/auth/updatePassword";
}
