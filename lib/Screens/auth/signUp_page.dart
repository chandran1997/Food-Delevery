import 'dart:ffi';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';



import '../../Models/signUp_body_model.dart';
import '../../Utilis/colors.dart';
import '../../Utilis/dimensions.dart';
import '../../base/show_custom_snackBar.dart';
import '../../widgets/app_text_fiels.dart';
import '../../widgets/big_text.dart';
import 'singnIn_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var signUpImages = [
      "assets/twitter.png",
      "assets/facebook.png",
      "assets/google.png",
    ];

    void _registration() {
      String name = nameController.text.trim();
      String phone = phoneController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      bool emailValid = true;
      emailValid = RegExp(
              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
          .hasMatch(email);

      if (email.isEmpty) {
        showCustomSnackBar("Type in your email address",
            title: "Email address");
      } else if (emailValid == false) {
        showCustomSnackBar("Type in your valid email address",
            title: "Valid email address");
      } else if (password.isEmpty) {
        showCustomSnackBar("Type in your password", title: "Password");
      } else if (password.length < 6) {
        showCustomSnackBar("Password can not be less than six characters",
            title: "Password");
      }
      if (name.isEmpty) {
        showCustomSnackBar("Type in your name", title: "name");
      } else if (phone.isEmpty) {
        showCustomSnackBar("Type in your Phone number", title: "Phone number");
      } else {
        showCustomSnackBar("All went well", title: "Perfect");
        SignUpBody signUpBody = SignUpBody(
          name: name,
          phone: phone,
          email: email,
          password: password,
        );
        print(signUpBody.toString());
      }
    }

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

            //your name,
            AppTextField(
              textEditingController: nameController,
              hintText: "Name",
              icon: Icons.person,
            ),
            SizedBox(height: Dimensions.height20),

            //your phone
            AppTextField(
              textEditingController: phoneController,
              hintText: "Phone",
              icon: Icons.phone,
            ),

            SizedBox(height: Dimensions.height20),

            GestureDetector(
              onTap: () {
                _registration();
              },
              child: Container(
                width: Dimensions.screenHeight / 4,
                height: Dimensions.screenHeight / 13,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color: AppColors.maincolor,
                ),
                child: Center(
                  child: BigText(
                    text: "Sign Up",
                    size: Dimensions.font20 + Dimensions.font20 / 2,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            SizedBox(height: Dimensions.height10),

            //sign Up button
            RichText(
              text: TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SignInPage())),
                text: "Have an account already?",
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: Dimensions.font20,
                ),
              ),
            ),

            SizedBox(height: Dimensions.screenHeight * 0.05),

            //sign Up option
            RichText(
              text: TextSpan(
                recognizer: TapGestureRecognizer()..onTap = () {},
                text: "Sign up using one of the following methods ",
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: Dimensions.font16,
                ),
              ),
            ),

            // Wrap(
            //   children: List.generate(3, (index) {
            //     return Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: CircleAvatar(
            //         backgroundColor: Colors.white,
            //         radius: Dimensions.radius30,
            //         backgroundImage: AssetImage(signUpImages[index]),
            //       ),
            //     );
            //   }),
            // ),
          ],
        ),
      ),
    );
  }
}
