import 'package:base/features/cart/ui/screen/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  void _navigateTo(int index, BuildContext context) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, "Home");
        break;
      case 1:
        Navigator.pushNamed(context, '/saved');
        break;
      case 2:
        Navigator.pushNamed(context, "CartScreen");
        break;
      case 3:
        Navigator.pushNamed(context, '/account');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) => _navigateTo(index, context),
      showUnselectedLabels: true,
      showSelectedLabels: true,
      elevation: 0,
      backgroundColor: Colors.white,
      unselectedItemColor: Color(0xff938F9C),
      selectedItemColor: const Color(0xFF452CE8),
      items: [
        BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: SvgPicture.asset("assets/icons/home.svg"),
            label: "Home"),
        BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/heart.svg"), label: "Saved"),
        BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/cart.svg"), label: "Cart"),
        BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/profile.svg"),
            label: "Account"),
      ],
      type: BottomNavigationBarType.fixed,
      unselectedFontSize: 12,
    );
  }
}
