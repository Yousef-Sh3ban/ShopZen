import 'package:base/features/authentication/ui/widgets/Custom_Login_Button.dart';
import 'package:base/features/authentication/ui/widgets/loginBottom.dart';
import 'package:base/features/authentication/ui/widgets/or_divider.dart';
import 'package:base/features/authentication/ui/widgets/start_text.dart';
import 'package:base/features/authentication/ui/widgets/text_bottom_login.dart';
import 'package:base/navigation/app_routes.dart';

import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 68),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StartText(
                  text: "Login to ShopZen",
                ),
                SizedBox(
                  height: 47,
                ),
                CustomLoginButton(
                    text: "Login with Google",
                    textcolor: Colors.black,
                    imagepath: "assets/images/image.png",
                    ContinarColor: Colors.white),
                SizedBox(
                  height: 16,
                ),
                CustomLoginButton(
                    text: "Login with Apple",
                    textcolor: Color(0xff323135),
                    imagepath: "assets/images/image copy.png",
                    ContinarColor: Colors.white),
                SizedBox(
                  height: 48,
                ),
                OrDvider(),
                SizedBox(
                  height: 48,
                ),
                LoginBottom(
                  text: "Login with Email",
                  color: Color(0xff452CE8),
                  ontap: () {},
                ),
                SizedBox(
                  height: 220,
                ),
                textBottomLogin(
                  text1: "Don’t have any account yet?",
                  text2: " Signup",
                  ontap: () {
                    Navigator.pushNamed(context, AppRoutes.LoginDefaultScreen);
                  },
                )
              ],
            ),
          ),
        ));
  }
}
