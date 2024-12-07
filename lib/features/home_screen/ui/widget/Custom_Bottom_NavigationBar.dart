import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({this.ontap});
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showUnselectedLabels: true,        elevation: 0, // No shadow

      backgroundColor: Colors.white,
      items: [
        BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/home.svg"), label: "Home"),
        BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/heart.svg"), label: "Saved"),
        BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/cart.svg"), label: "Cart"),
        BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/profile.svg"),
            label: "Account"),
      ],
      selectedItemColor: const Color(0xFF452CE8),
      unselectedItemColor: const Color(0xFF938F9C),
    );
  }
}
