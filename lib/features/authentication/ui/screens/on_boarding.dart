import 'package:base/features/authentication/ui/widgets/login_bottom.dart';
import 'package:base/navigation/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 29,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 123,
            ),
            SvgPicture.asset("assets/images/onboarding_image.svg"),
            const Text(
              "Welcome to ShopZen",
              style: TextStyle(
                color: Color(0xff323135),
                fontWeight: FontWeight.w400,
                fontSize: 32,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "Your one-stop destination for hassle-",
              style: TextStyle(
                color: Color(0xff68656E),
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
            const Center(
              child: Text(
                "free online shopping",
                style: TextStyle(
                  color: Color(0xff68656E),
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
              color: const Color(0xff452CE8),
              ontap: () {
                Navigator.pushNamed(context, AppRoutes.login);
              },
            ),
          ],
        ),
      ),
    );
  }
}
