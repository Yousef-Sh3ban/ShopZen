// import 'package:flutter/material.dart';

// class Splash extends StatelessWidget {
//   const Splash({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xff452CE8),
//       body: Center(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset("assets/images/logo.png"),
//             SizedBox(
//               width: 20.68,
//             ),
//             Text(
//               "ShopZen",
//               style: TextStyle(
//                 color: Color(0xffFBFBFC),
//                 fontSize: 44.81,
//                 fontWeight: FontWeight.w700,
//                 fontFamily: "Pacifico",
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:base/features/authentication/ui/screens/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

  @override
  void initState() {
    super.initState();

    // Initialize Animation Controller
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    );

    // Define Animations
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

    // Start the animation
    _controller.forward();

    // Navigate to the next screen after 4 seconds
    Future.delayed(const Duration(seconds: 20), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnBoarding()),
      );
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
                      fontFamily: "Satoshi",
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
