import 'package:ecommarce_app/Utilis/app_constant.dart';
import 'package:get/get.dart';

import 'package:ecommarce_app/Data/api/api_client.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;
  PopularProductRepo({
    required this.apiClient,
  });

  Future<Response> getPopularProductList() async {
    //end point
    return await apiClient.getData(AppConstants.POPULAR_PRODUCT_URI);
  }
}
