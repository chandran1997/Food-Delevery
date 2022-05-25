import 'package:ecommarce_app/Controller/card_controller.dart';
import 'package:ecommarce_app/Controller/recommended_product_controller.dart';
import 'package:ecommarce_app/Helper/dependencies.dart';
import 'package:ecommarce_app/Screens/auth/signUp_page.dart';
import 'package:ecommarce_app/Screens/home/main_food_Page.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'Controller/popular_product_controller.dart';
import 'routes/route_helper.dart';
import 'package:ecommarce_app/Helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // home: const MainFoodPage(),
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
    );
  }
}
