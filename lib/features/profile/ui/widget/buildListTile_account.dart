import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget buildListTile(BuildContext context,
    {required String iconPath,
    required String title,
    required Function() onTap,
    Color textColor = const Color(0xff323135),
    Color iconColor = Colors.black}) {
  return ListTile(
    leading: SvgPicture.asset(
      iconPath,
      height: 24,
      width: 24,
      color: iconColor,
    ),
    title: Text(
      title,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: textColor,
      ),
    ),
    trailing: Icon(Icons.arrow_forward_ios, color: Color(0xff323135)),
    onTap: onTap,
  );
}
