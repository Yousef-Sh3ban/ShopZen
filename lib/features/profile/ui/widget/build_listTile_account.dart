import 'package:base/configurations/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget buildListTile(BuildContext context,
    {bool arrow_forward = true,
    required String iconPath,
    required String title,
    required Function() onTap,
    Color? textColor,
    Color? iconColor}) {
  return ListTile(
    leading: SvgPicture.asset(
      iconPath,
      height: 24,
      width: 24,
      color: textColor ?? Theme.of(context).textTheme.bodyMedium!.color,
    ),
    title: Text(
      title,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: iconColor ?? Theme.of(context).textTheme.bodyMedium!.color,
      ),
    ),
    trailing: arrow_forward
        ? Icon(Icons.arrow_forward_ios, color: AppTheme.darkPrimary)
        : SizedBox(),
    onTap: onTap,
  );
}
