import 'package:animate_do/animate_do.dart';
import 'package:base/configurations/app_theme.dart';
import 'package:base/features/authentication/ui/widgets/custom_login_button.dart';
import 'package:base/features/authentication/ui/widgets/login_bottom.dart';
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
        body: FadeIn(
          delay: Duration(milliseconds: 250),
          duration: Duration(milliseconds: 700),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const StartText(
                  text: "Login to ShopZen",
                ),
                const SizedBox(
                  height: 47,
                ),
                const CustomLoginButton(
                  text: "Login with Google",
                  imagepath: "assets/images/image.png",
                ),
                const SizedBox(
                  height: 16,
                ),
                const CustomLoginButton(
                  changeColor: true,
                  text: "Login with Apple",
                  imagepath: "assets/images/image copy.png",
                ),
                const SizedBox(
                  height: 48,
                ),
                const OrDvider(),
                const SizedBox(
                  height: 48,
                ),
                LoginBottom(
                  text: "Login with Email",
                  color: AppTheme.mainColor,
                  ontap: () {
                    Navigator.pushNamed(context, AppRoutes.loginDefaultScreen);
                  },
                ),
                Expanded(child: SizedBox()),
                TextBottomLogin(
                  text1: "Don’t have any account yet? ",
                  text2: "Signup",
                  ontap: () {
                    Navigator.pushNamed(context, AppRoutes.signup);
                  },
                )
                ,const SizedBox(
                  height: 64,
                ),
              ],
            ),
          ),
        ));
  }
}
