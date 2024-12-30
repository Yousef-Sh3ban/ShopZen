import 'package:flutter/material.dart';

Widget buildSwitchTile({
  required String title,
  required bool value,
  required Function(bool) onChanged,
}) {
  return ListTile(
    title: Text(
      title,
      style: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w500, ),
    ),
    trailing: Transform.scale(
      scale: 0.8,
      child: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: Colors.white,
        activeTrackColor: Color(0xff323135),
        inactiveThumbColor: Colors.white,
        inactiveTrackColor: Color(0xffCECDD4),
      ),
    ),
  );
}
