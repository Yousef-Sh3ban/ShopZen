import 'package:base/app/bloc/settings_cubit.dart';
import 'package:base/features/authentication/ui/widgets/custom_login_button.dart';
import 'package:base/features/authentication/ui/widgets/login_bottom.dart';
import 'package:base/features/authentication/ui/widgets/or_divider.dart';
import 'package:base/features/authentication/ui/widgets/start_text.dart';
import 'package:base/features/authentication/ui/widgets/text_bottom_login.dart';
import 'package:base/navigation/app_routes.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // IconButton(
            //   icon: Icon(SettingsCubit.instance.isDarkMode
            //       ? Icons.dark_mode
            //       : Icons.light_mode),
            //   onPressed: () {
            //     context.read<SettingsCubit>().toggleDarkMode();
            //   },
            // ),
            const StartText(
              text: "Login to ShopZen",
            ),
            const SizedBox(
              height: 47,
            ),
            const CustomLoginButton(
              text: "Login with Google",
              // textcolor: Colors.black,
              imagepath: "assets/images/image.png",
              // continarColor: Colors.white
            ),
            const SizedBox(
              height: 16,
            ),
            const CustomLoginButton(
              changeColor: true,
              text: "Login with Apple",
              // textcolor: Color(0xff323135),
              imagepath: "assets/images/image copy.png",
              // continarColor: Colors.white
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
              color: const Color(0xff452CE8),
              ontap: () {
                Navigator.pushNamed(context, AppRoutes.loginDefaultScreen);
              },
            ),
            const SizedBox(
              height: 220,
            ),
            TextBottomLogin(
              text1: "Don’t have any account yet? ",
              text2: "Signup",
              ontap: () {
                Navigator.pushNamed(context, AppRoutes.signup);
              },
            )
          ],
        ),
      ),
    ));
  }
}
