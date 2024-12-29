import 'package:base/features/profile/ui/widget/LogoutBottomSheet.dart';
import 'package:base/features/profile/ui/widget/buildListTile_account.dart';
import 'package:base/navigation/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Account',
          style: TextStyle(
            color: Color(0xff323135),
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: ListView(
        children: [
          buildListTile(
            context,
            iconPath: 'assets/icons/user.svg',
            title: 'Your Profile',
            onTap: () {},
          ),
          Divider(),
          buildListTile(
            context,
            iconPath: 'assets/icons/content.svg',
            title: 'My Order',
            onTap: () {},
          ),
          Divider(),
          buildListTile(
            context,
            iconPath: 'assets/icons/cridet_card.svg',
            title: 'Payment Methods',
            onTap: () {},
          ),
          Divider(),
          buildListTile(
            context,
            iconPath: 'assets/icons/notfactinon.svg',
            title: 'Notifications',
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.NotificationSettings);
            },
          ),
          Divider(),
          buildListTile(
            context,
            iconPath: 'assets/icons/clic_loc.svg',
            title: 'Privacy Policy',
            onTap: () {},
          ),
          Divider(),
          buildListTile(
            context,
            iconPath: 'assets/icons/user_add.svg',
            title: 'Invite Friends',
            onTap: () {},
          ),
          Divider(),
          buildListTile(
            context,
            iconPath: 'assets/icons/logout.svg',
            title: 'Log Out',
            textColor: Colors.red,
            iconColor: Colors.red,
            onTap: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return LogoutBottomSheet();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
