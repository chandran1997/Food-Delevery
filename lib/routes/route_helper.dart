import 'package:ecommarce_app/Screens/cards/cart_page.dart';
import 'package:ecommarce_app/Screens/food/popular_food_details.dart';
import 'package:ecommarce_app/Screens/food/recommanded_food_details.dart';
import 'package:ecommarce_app/Screens/home/home_page.dart';
import 'package:ecommarce_app/Screens/home/main_food_Page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage = "/cart-page";

  static String getInitial() => "$initial";
  static String getPopularFood(int pageId, String page) =>
      "$popularFood?pageId=$pageId&page=$page";
  static String getRecommendedFood(int pageId, String page) =>
      "$recommendedFood?pageId=$pageId&page=$page";
  static String getCartPage() => "$cartPage";

  static List<GetPage> routes = [
    GetPage(name: "/", page: () => const HomePage()),
    GetPage(
        name: popularFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters['page'];
          return PopularFoodDetails(
            pageId: int.parse(
              pageId!,
            ),
            page: page!,
          );
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters['page'];
          return RecommandedFoodDetails(
            pageId: int.parse(pageId!),
            page: page!,
          );
        },
        transition: Transition.fadeIn),
    GetPage(
      name: cartPage,
      page: () {
        return const CartPages();
      },
      transition: Transition.fadeIn,
    )
  ];
}
