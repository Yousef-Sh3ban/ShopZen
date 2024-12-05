import 'package:base/features/authentication/ui/widgets/loginBottom.dart';
import 'package:base/navigation/app_routes.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 29,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 123,
          ),
          Image.asset("assets/images/Add to Cart-cuate 1.png"),
          Text(
            "Welcome to ShopZen",
            style: TextStyle(
              color: Color(0xff323135),
              fontWeight: FontWeight.w400,
              fontSize: 32,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "Your one-stop destination for hassle-",
            style: TextStyle(
              color: Color(0xff68656E),
              fontSize: 18,
            ),
          ),
          Center(
            child: Text(
              "free online shopping",
              style: TextStyle(
                color: Color(0xff68656E),
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(
            height: 62,
          ),
          LoginBottom(
            text: "Get Started",
            color: Color(0xff452CE8),
            ontap: () {
              Navigator.pushNamed(context, AppRoutes.Login);
            },
          ),
        ]),
      ),
    );
  }
}
