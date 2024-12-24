import 'package:base/features/authentication/ui/widgets/custom_login_button.dart';
import 'package:base/features/authentication/ui/widgets/login_bottom.dart';
import 'package:base/features/authentication/ui/widgets/or_divider.dart';
import 'package:base/features/authentication/ui/widgets/start_text.dart';
import 'package:base/features/authentication/ui/widgets/text_bottom_login.dart';
import 'package:base/navigation/app_routes.dart';

import 'package:flutter/material.dart';

class SingupScreen extends StatelessWidget {
  const SingupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 68),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const StartText(
                text: "Singup to ShopZen",
              ),
              const SizedBox(
                height: 47,
              ),
              const CustomLoginButton(
                text: "Singup with Google",
                imagepath: "assets/images/image.png",
              ),
              const SizedBox(
                height: 16,
              ),
              const CustomLoginButton(
                changeColor: true,
                text: "Singup with Apple",
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
                text: "Singup with Email",
                color: const Color(0xff452CE8),
                ontap: () {
                  Navigator.pushNamed(context, AppRoutes.signupDefaultScreen);
                },
              ),
              const SizedBox(
                height: 220,
              ),
              TextBottomLogin(
                text1: "Don’t have any account yet?",
                text2: " Login",
                ontap: () {
                  Navigator.pushNamed(context, AppRoutes.login);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
