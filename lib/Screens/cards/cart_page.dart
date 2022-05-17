import 'package:ecommarce_app/Utilis/colors.dart';
import 'package:ecommarce_app/Utilis/dimensions.dart';
import 'package:ecommarce_app/widgets/app_icon.dart';
import 'package:flutter/material.dart';

class CartPages extends StatelessWidget {
  const CartPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  iconColor: Colors.white,
                  backgroundColor: AppColors.maincolor,
                  size: Dimensions.iconSize34,
                ),
                SizedBox(
                  width: Dimensions.width20 * 3,
                ),
                AppIcon(
                  icon: Icons.home_outlined,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.maincolor,
                  size: Dimensions.iconSize34,
                ),
                AppIcon(
                  icon: Icons.shopping_cart,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.maincolor,
                  size: Dimensions.iconSize34,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
