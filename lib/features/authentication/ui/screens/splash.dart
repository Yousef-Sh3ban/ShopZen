
import 'package:base/navigation/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<double> _widthAnimation;
  late Animation<double> _heightAnimation;
  bool isLogin = false;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _opacityAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _widthAnimation = Tween<double>(begin: 50.0, end: 100.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _heightAnimation = Tween<double>(begin: 50.0, end: 100.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.forward();

    Future.delayed(const Duration(seconds: 3), () async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
      if (isLoggedIn) {
        Navigator.pushReplacementNamed(context, AppRoutes.home);
      } else {
        Navigator.pushReplacementNamed(context, AppRoutes.onBoarding);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff452CE8),
      body: Center(
        child: FadeTransition(
          opacity: _opacityAnimation,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: _widthAnimation.value,
                    height: _heightAnimation.value,
                    child: SvgPicture.asset("assets/images/logo.svg"),
                  ),
                  const SizedBox(width: 30),
                  Text(
                    "ShopZen",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: const Color(0xffFBFBFC),
                      fontSize: _widthAnimation.value / 2,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
