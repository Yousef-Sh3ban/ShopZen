import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key,required this.ontap});
  final void Function(int) ontap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: ontap,
      showUnselectedLabels: true,
      elevation: 0,
      backgroundColor: Colors.white,
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
      selectedItemColor: const Color(0xFF452CE8),
      unselectedItemColor: const Color(0xFF938F9C),
    );
  }
}

