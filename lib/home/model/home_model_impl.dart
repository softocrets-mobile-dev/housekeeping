import 'package:housekeeping_pro/home/model/home_model.dart';
import 'package:housekeeping_pro/networking/network_apis.dart';
import 'package:housekeeping_pro/networking/network_base_helper.dart';
import 'package:housekeeping_pro/networking/network_response.dart';

class HomeModelImpl implements HomeModel {
  final NetworkBaseHelper helper = NetworkBaseHelper();

  @override
  Future<NetworkResponse<List<String>?>> getAppContextData() async {
    try {
      final response = await helper.getApi(
        NetworkApis.appContextData,
        {},
      );
      if (response != null) {
        if (response.statusCode == 200) {
          //Convert List<dynamic> into List<String>
          final data = response.data as List<dynamic>;
          final dataList = data.map((e) => e.toString()).toList();
          return NetworkResponse<List<String>>.success(dataList,
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
}
