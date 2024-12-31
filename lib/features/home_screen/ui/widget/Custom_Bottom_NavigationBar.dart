import 'package:base/configurations/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.ontap,
    required this.selectedIndex,
  });
  final void Function(int) ontap;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(

      backgroundColor: Theme.of(context).bottomAppBarTheme.color,
      currentIndex: selectedIndex,
      onTap: ontap,
      showUnselectedLabels: true,
      elevation: 0.4,
      items: [
        BottomNavigationBarItem(
          backgroundColor: Colors.white,
          icon: SvgPicture.asset(
            "assets/icons/home.svg",
            color: selectedIndex == 0
                ? AppTheme.mainColor
                : const Color(0xFF938F9C),
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/heart.svg",
              color: selectedIndex == 1
                  ? AppTheme.mainColor
                  : const Color(0xFF938F9C),
            ),
            label: "Saved"),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/cart.svg",
              color: selectedIndex == 2
                  ? AppTheme.mainColor
                  : const Color(0xFF938F9C),
            ),
            label: "Cart"),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/profile.svg",
              color: selectedIndex == 3
                  ? AppTheme.mainColor
                  : const Color(0xFF938F9C),
            ),
            label: "Account"),
      ],
      type: BottomNavigationBarType.fixed,
      unselectedFontSize: 12,
      selectedItemColor: AppTheme.mainColor,
      unselectedItemColor: const Color(0xFF938F9C),
    );
  }
}
