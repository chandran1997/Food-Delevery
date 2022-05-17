import 'package:ecommarce_app/Screens/food/popular_food_details.dart';
import 'package:ecommarce_app/Screens/food/recommanded_food_details.dart';
import 'package:ecommarce_app/Screens/home/main_food_Page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";

  static String getInitial() => "$initial";
  static String getPopularFood(int pageId) => "$popularFood?pageId=$pageId";
  static String getRecommendedFood(int pageId) =>
      "$recommendedFood?pageId=$pageId";

  static List<GetPage> routes = [
    GetPage(name: "/", page: () => const MainFoodPage()),
    GetPage(
        name: popularFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          return PopularFoodDetails(
            pageId: int.parse(pageId!),
          );
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          return RecommandedFoodDetails(
            pageId: int.parse(pageId!),
          );
        },
        transition: Transition.fadeIn)
  ];
}
