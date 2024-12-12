import 'package:base/app/bloc/settings_cubit.dart';
import 'package:base/navigation/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LocationSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 40,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Location",
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF68656E),
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  "Dhaka, Bangladesh",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    //  color:  Theme.of(context).textTheme.bodyLarge?.color
                    //color: Color(0xFF323135)
                  ),
                ),
                IconButton(
                  icon: Icon(SettingsCubit.instance.isDarkMode
                      ? Icons.dark_mode
                      : Icons.light_mode),
                  onPressed: () {
                    context.read<SettingsCubit>().toggleDarkMode();
                  },
                ),
              ],
            ),
            InkWell(
              child: SvgPicture.asset(
                "assets/icons/notifcation.svg",
                width: 25,
                height: 25,
                color: Theme.of(context).iconTheme.color,
              ),
              onTap: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.notifaction,
                );
              },
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Find your favorite items",
              hintStyle: const TextStyle(
                  color: Color(0xFF938F9C),
                  fontWeight: FontWeight.w400,
                  fontSize: 14),
              prefixIcon: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: SvgPicture.asset(
                  "assets/icons/search.svg",
                ),
              ),
              suffixIcon: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: SvgPicture.asset(
                  "assets/icons/qr.svg",
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: const Color(0xFFFBFBFC),
            ),
          ),
        ),
      ],
    );
  }
}
