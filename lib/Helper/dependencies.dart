import 'package:ecommarce_app/Controller/recommended_product_controller.dart';
import 'package:ecommarce_app/Data/api/api_client.dart';
import 'package:ecommarce_app/Data/respository/popular_product_repo.dart';
import 'package:ecommarce_app/Data/respository/recommended_product_repo.dart';
import 'package:ecommarce_app/Utilis/app_constant.dart';
import 'package:get/get.dart';

import '../Controller/popular_product_controller.dart';

Future<void> init() async {
  //load the dependencies // load apiclient
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  // load respository
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));

  //load controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
}
