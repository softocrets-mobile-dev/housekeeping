import 'package:housekeeping_pro/networking/network_response.dart';

abstract class HomeModel {
  Future<NetworkResponse> getAppContextData();
}
