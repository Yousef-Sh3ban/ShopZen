import 'package:base/configurations/app_theme.dart';
import 'package:base/features/authentication/ui/widgets/login_bottom.dart';
import 'package:base/navigation/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 29,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 79,
            ),
            SvgPicture.asset("assets/images/onboarding_image.svg"),
            const SizedBox(
              height: 78,
            ),
            const Text(
              "Welcome to ShopZen",
              style: TextStyle(
                fontFamily: "Alata",
                fontWeight: FontWeight.w400,
                fontSize: 32,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
             Text(
              "Your one-stop destination for hassle-",
              style: TextStyle(
                color: AppTheme.maingrey,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
            const Center(
              child: Text(
                "free online shopping",
                style: TextStyle(
                  color: AppTheme.maingrey,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(
              height: 62,
            ),
            LoginBottom(
              text: "Get Started",
              color: AppTheme.mainColor,
              ontap: () {
                Navigator.pushReplacementNamed(context, AppRoutes.login);
              },
            ),
          ],
        ),
      ),
    );
  }
}
