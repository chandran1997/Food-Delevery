import 'package:ecommarce_app/Utilis/colors.dart';
import 'package:ecommarce_app/Utilis/dimensions.dart';
import 'package:ecommarce_app/widgets/big_text.dart';
import 'package:ecommarce_app/widgets/small_text.dart';
import 'package:flutter/material.dart';

import 'food_page_body.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    // print('height +${MediaQuery.of(context).size.height}');
    // print('width +${MediaQuery.of(context).size.width}');
    return Scaffold(
      body: Column(
        children: [
          //showing the header
          Container(
            child: Container(
              margin: EdgeInsets.only(
                  top: Dimensions.height45, bottom: Dimensions.height15),
              padding: EdgeInsets.only(
                  left: Dimensions.width20, right: Dimensions.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(
                        text: 'Bangladesh',
                        color: AppColors.maincolor,
                      ),
                      Row(
                        children: [
                          SmallText(
                            text: 'Naringdi',
                            color: Colors.black45,
                          ),
                          Icon(Icons.arrow_drop_down_rounded)
                        ],
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius15),
                          color: AppColors.maincolor),
                      child: Icon(
                        Icons.search,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          //showing the body
          const Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: FoodPageBody(),
            ),
          ),
        ],
      ),
    );
  }
}
