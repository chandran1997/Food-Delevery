import 'package:ecommarce_app/Utilis/app_constant.dart';
import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  String? token; //token id
  final String appBaseUrl; //server url
  late Map<String, String> _mainHeaders;
  ApiClient({
    required this.appBaseUrl,
  }) {
    //getx package management system
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 30);
    token = AppConstants.TOKEN;
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }

  //Get Method
  Future<Response> getData(
    String uri,
  ) async {
    try {
      //create get request
      Response response = await get(uri);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
