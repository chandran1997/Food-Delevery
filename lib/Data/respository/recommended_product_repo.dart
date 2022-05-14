import 'package:ecommarce_app/Utilis/app_constant.dart';
import 'package:get/get.dart';

import 'package:ecommarce_app/Data/api/api_client.dart';

class RecommendedProductRepo extends GetxService {
  final ApiClient apiClient;
  RecommendedProductRepo({
    required this.apiClient,
  });

  Future<Response> getRecommendedProductList() async {
    //end point
    return await apiClient.getData(AppConstants.RECOMMENDED_PRODUCT_URI);
  }
}
