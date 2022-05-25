import 'package:ecommarce_app/Controller/card_controller.dart';
import 'package:ecommarce_app/Controller/popular_product_controller.dart';
import 'package:ecommarce_app/Controller/recommended_product_controller.dart';
import 'package:ecommarce_app/Utilis/app_constant.dart';
import 'package:ecommarce_app/Utilis/colors.dart';
import 'package:ecommarce_app/Utilis/dimensions.dart';
import 'package:ecommarce_app/routes/route_helper.dart';
import 'package:ecommarce_app/widgets/app_icon.dart';
import 'package:ecommarce_app/widgets/big_text.dart';
import 'package:ecommarce_app/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/main_food_Page.dart';

class CartPages extends StatelessWidget {
  const CartPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<CartController>();
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: Dimensions.height20 * 3,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.arrow_back_ios,
                  iconSize: Dimensions.iconSize24,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.maincolor,
                  size: (Dimensions.iconSize16 * 3) - 5,
                ),
                SizedBox(
                  width: Dimensions.width20 * 3,
                ),
                GestureDetector(
                  onTap: (() {
                    Get.toNamed(RouteHelper.getInitial());
                  }),
                  child: AppIcon(
                    icon: Icons.home_outlined,
                    iconSize: Dimensions.iconSize24,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.maincolor,
                    size: (Dimensions.iconSize16 * 3) - 5,
                  ),
                ),
                AppIcon(
                  icon: Icons.shopping_cart,
                  iconSize: Dimensions.iconSize24,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.maincolor,
                  size: (Dimensions.iconSize16 * 3) - 5,
                ),
              ],
            ),
          ),
          Positioned(
            top: Dimensions.height20 * 5,
            left: Dimensions.width20,
            right: Dimensions.width20,
            bottom: 0,
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.height15),
              // color: Colors.greenAccent,
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: GetBuilder<PopularProductController>(
                  builder: (cartontroller) {
                    var _cartList = cartontroller.getItems;
                    return ListView.builder(
                        itemCount: _cartList.length,
                        itemBuilder: (_, index) {
                          return Container(
                            height: 100,
                            width: double.maxFinite,
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    var popularIndex =
                                        Get.find<PopularProductController>()
                                            .popularProductList
                                            .indexOf(_cartList[index].product!);
                                    if (popularIndex >= 0) {
                                      Get.toNamed(RouteHelper.getPopularFood(
                                          popularIndex, "cartPage"));
                                    } else {
                                      var recommendedIndex = Get.find<
                                              RecommendedProductController>()
                                          .recommendedProductList
                                          .indexOf(_cartList[index].product!);
                                      Get.toNamed(
                                          RouteHelper.getRecommendedFood(
                                              recommendedIndex, "cartPage"));
                                    }
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        bottom: Dimensions.height10),
                                    width: Dimensions.height20 * 5,
                                    height: Dimensions.height20 * 5,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(AppConstants
                                                .BASE_URL +
                                            AppConstants.UPLOAD_URL +
                                            cartontroller.getItems[index].img!),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.radius20),
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(width: Dimensions.width15),
                                Expanded(
                                  child: Container(
                                    height: Dimensions.height20 * 5,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        BigText(
                                          text: cartontroller
                                              .getItems[index].name!,
                                          color: Colors.black45,
                                        ),
                                        SmallText(text: "Spicy"),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            BigText(
                                              text: cartontroller
                                                  .getItems[index].price!
                                                  .toString(),
                                              color: Colors.redAccent,
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(
                                                top: Dimensions.height10,
                                                bottom: Dimensions.height10,
                                                left: Dimensions.width30,
                                                right: Dimensions.width30,
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Dimensions.radius20),
                                                color: Colors.white,
                                              ),
                                              child: Row(
                                                children: [
                                                  GestureDetector(
                                                    onTap: (() {
                                                      cartontroller
                                                          .addtocardPageItems(
                                                              _cartList[index]
                                                                  .product!,
                                                              -1);
                                                    }),
                                                    child: Icon(
                                                      Icons.remove,
                                                      color: AppColors
                                                          .appsignColor,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        Dimensions.width10 / 2,
                                                  ),
                                                  BigText(
                                                    text: _cartList[index]
                                                        .quantity!
                                                        .toString(), //popularProduct.inCardItems.toString(),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        Dimensions.width10 / 2,
                                                  ),
                                                  GestureDetector(
                                                    onTap: (() {
                                                      cartontroller
                                                          .addtocardPageItems(
                                                              _cartList[index]
                                                                  .product!,
                                                              1);
                                                    }),
                                                    child: Icon(
                                                      Icons.add,
                                                      color: AppColors
                                                          .appsignColor,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        });
                  },
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: (controller) {
          return Container(
            height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.only(
              top: Dimensions.height30,
              bottom: Dimensions.height30,
              left: Dimensions.width30,
              right: Dimensions.width30,
            ),
            decoration: BoxDecoration(
              color: AppColors.buttonBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius20 * 2),
                topRight: Radius.circular(Dimensions.radius20 * 2),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: Dimensions.height20,
                    bottom: Dimensions.height20,
                    left: Dimensions.width30,
                    right: Dimensions.width30,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: Dimensions.width10 / 2,
                      ),
                      BigText(
                        text: "\$ ${controller.totalAmount.toString()}",
                      ),
                      SizedBox(
                        width: Dimensions.width10 / 2,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: Dimensions.height20,
                    bottom: Dimensions.height20,
                    left: Dimensions.width30,
                    right: Dimensions.width30,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: AppColors.maincolor,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      // popularProduct.addItem(product);
                    },
                    child: BigText(
                      text: "Check out",
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
