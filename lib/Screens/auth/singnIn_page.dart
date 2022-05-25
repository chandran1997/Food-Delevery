
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';



import '../../../widgets/app_text_fiels.dart';
import '../../Utilis/colors.dart';
import '../../Utilis/dimensions.dart';
import '../../widgets/big_text.dart';
import 'signUp_page.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: Dimensions.screenHeight * 0.05,
            ),

            //app logo
            Container(
              height: Dimensions.screenHeight * 0.25,
              child: Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 80,
                  backgroundImage: AssetImage("assets/pic.png"),
                ),
              ),
            ),

            //welcome
            Container(
              width: double.maxFinite,
              margin: EdgeInsets.only(left: Dimensions.width20),
              child: Column(
                children: [
                  Text(
                    "Hello",
                    style: TextStyle(
                      fontSize: Dimensions.font20 * 3 + Dimensions.font20 / 2,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),

            RichText(
              text: TextSpan(
                text: "Sign into your sccount",
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: Dimensions.font20,
                ),
              ),
            ),
            SizedBox(height: Dimensions.height20),
            //your email
            AppTextField(
              textEditingController: emailController,
              hintText: "Email",
              icon: Icons.email,
            ),
            SizedBox(height: Dimensions.height20),

            //your password
            AppTextField(
              textEditingController: passwordController,
              hintText: "Password",
              icon: Icons.password_sharp,
            ),
            SizedBox(height: Dimensions.height20),

            Container(
              padding: EdgeInsets.only(right: Dimensions.width20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RichText(
                    text: TextSpan(
                      text: "Sign into your sccount",
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: Dimensions.font20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Dimensions.height20),
            SizedBox(height: Dimensions.height10),
            //sign Up button
            Container(
              width: Dimensions.screenHeight / 4,
              height: Dimensions.screenHeight / 13,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: AppColors.maincolor,
              ),
              child: Center(
                child: BigText(
                  text: "Sign In",
                  size: Dimensions.font20 + Dimensions.font20 / 2,
                  color: Colors.white,
                ),
              ),
            ),

            SizedBox(height: Dimensions.height10),

            SizedBox(height: Dimensions.screenHeight * 0.05),

            //sign Up option
            RichText(
              text: TextSpan(
                  text: "Dont\'t have an account? ",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: Dimensions.font16,
                  ),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => SignUpPage(),
                              ),
                            ),
                      text: "Create ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.mainBlackColor,
                        fontSize: Dimensions.font20,
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
