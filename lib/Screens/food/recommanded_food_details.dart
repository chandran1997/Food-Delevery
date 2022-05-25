import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:ecommarce_app/Controller/popular_product_controller.dart';
import 'package:ecommarce_app/Controller/recommended_product_controller.dart';
import 'package:ecommarce_app/Screens/cards/cart_page.dart';
import 'package:ecommarce_app/Utilis/app_constant.dart';
import 'package:ecommarce_app/Utilis/colors.dart';
import 'package:ecommarce_app/Utilis/dimensions.dart';
import 'package:ecommarce_app/routes/route_helper.dart';
import 'package:ecommarce_app/widgets/app_icon.dart';
import 'package:ecommarce_app/widgets/big_text.dart';
import 'package:ecommarce_app/widgets/expandable_text_widgets.dart';

import '../../Controller/card_controller.dart';

class RecommandedFoodDetails extends StatelessWidget {
  final String page;
  final int pageId;
  const RecommandedFoodDetails({
    Key? key,
    required this.page,
    required this.pageId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var recommendedProduct =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(recommendedProduct, Get.find<CartController>());
    // var recommendedProduct =
    //     Provider.of<RecommendedProductController>(context, listen: false)
    //         .recommendedProductList[pageId];
    // Provider.of<PopularProductController>(context, listen: false).initProduct(
    //     recommendedProduct,
    //     Provider.of<CartController>(context, listen: false));

    return Scaffold(
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 70,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (page == "cartPage") {
                        Get.toNamed(RouteHelper.getCartPage());
                      } else {
                        Get.toNamed(RouteHelper.getInitial());
                      }
                    },
                    child: AppIcon(icon: Icons.clear),
                  ),
                  GetBuilder<PopularProductController>(builder: (controller) {
                    return GestureDetector(
                      onTap: (() {
                        if (controller.totalItems >= 1) {
                          Get.toNamed(RouteHelper.getCartPage());
                        }
                      }),
                      child: Stack(
                        children: [
                          AppIcon(icon: Icons.shopping_cart_outlined),
                          controller.totalItems >= 1
                              ? Positioned(
                                  right: 0,
                                  top: 0,
                                  child: AppIcon(
                                    icon: Icons.circle,
                                    size: 20,
                                    iconColor: Colors.transparent,
                                    backgroundColor: AppColors.maincolor,
                                  ),
                                )
                              : Container(),
                          controller.totalItems >= 1
                              ? Positioned(
                                  right: 4,
                                  top: 4,
                                  child: BigText(
                                    text: controller.totalItems.toString(),
                                    size: 12,
                                    color: Colors.white,
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    );
                  })
                ],
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(20),
                child: Container(
                  padding: EdgeInsets.only(top: 5, bottom: 10),
                  child: Center(
                    child: BigText(
                      text: recommendedProduct.name!,
                      size: Dimensions.font26,
                    ),
                  ),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.radius20),
                        topRight: Radius.circular(Dimensions.radius20),
                      )),
                ),
              ),
              pinned: true,
              backgroundColor: AppColors.yellowColor,
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  AppConstants.BASE_URL +
                      AppConstants.UPLOAD_URL +
                      recommendedProduct.img!,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(
                child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: Dimensions.width20, right: Dimensions.width20),
                  child: ExpandableTextWidgets(
                      text: recommendedProduct.description!),
                )
              ],
            )),
          ],
        ),
        bottomNavigationBar:
            GetBuilder<PopularProductController>(builder: (controller) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: Dimensions.width20 * 3,
                  right: Dimensions.width20 * 3,
                  top: Dimensions.height10,
                  bottom: Dimensions.height10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (() {
                        controller.setQuantity(false);
                      }),
                      child: AppIcon(
                          iconSize: Dimensions.iconSize24,
                          iconColor: Colors.white,
                          backgroundColor: AppColors.maincolor,
                          icon: Icons.remove),
                    ),
                    BigText(
                      text:
                          "\$ ${recommendedProduct.price!}  X  ${controller.inCardItems} ",
                      color: AppColors.mainBlackColor,
                      size: Dimensions.font26,
                    ),
                    GestureDetector(
                      onTap: (() {
                        controller.setQuantity(true);
                      }),
                      child: AppIcon(
                          iconSize: Dimensions.iconSize24,
                          iconColor: Colors.white,
                          backgroundColor: AppColors.maincolor,
                          icon: Icons.add),
                    )
                  ],
                ),
              ),
              Container(
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
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.favorite,
                          color: AppColors.maincolor,
                        )),
                    GestureDetector(
                      onTap: (() {
                        controller.addItem(recommendedProduct);
                      }),
                      child: Container(
                        padding: EdgeInsets.only(
                          top: Dimensions.height20,
                          bottom: Dimensions.height20,
                          left: Dimensions.width30,
                          right: Dimensions.width30,
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                          color: AppColors.maincolor,
                        ),
                        child: BigText(
                          text: "\$ ${recommendedProduct.price!} | Add to card",
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        }));
  }
}
