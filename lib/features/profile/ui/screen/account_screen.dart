import 'package:animate_do/animate_do.dart';
import 'package:base/app/bloc/settings_cubit.dart';
import 'package:base/configurations/app_theme.dart';
import 'package:base/features/profile/ui/widget/logout_bottomSheet.dart';
import 'package:base/features/profile/ui/widget/build_listTile_account.dart';
import 'package:base/navigation/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        title: FadeInDown(
          from: 50,
          child: const Text(
            'Account',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: FadeIn(
        duration: const Duration(milliseconds: 700),
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            buildListTile(
              context,
              iconPath: 'assets/icons/user.svg',
              title: 'Your Profile',
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.profileScreen);
              },
            ),
            _buildDivider(),
            buildListTile(
              context,
              iconPath: 'assets/icons/content.svg',
              title: 'My Order',
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.myOrderScreen);
              },
            ),
            _buildDivider(),
            buildListTile(
              context,
              iconPath: 'assets/icons/cridet_card.svg',
              title: 'Payment Methods',
              onTap: () {},
            ),
            _buildDivider(),
            buildListTile(
              context,
              iconPath: 'assets/icons/notfactinon.svg',
              title: 'Notifications',
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.notificationSettings);
              },
            ),
            _buildDivider(),
            buildListTile(
              context,
              iconPath: 'assets/icons/clic_loc.svg',
              title: 'Privacy Policy',
              onTap: () {},
            ),
            _buildDivider(),
            buildListTile(
              context,
              iconPath: 'assets/icons/user_add.svg',
              title: 'Invite Friends',
              onTap: () {},
            ),
            _buildDivider(),
            buildListTile(
              context,
              arrow_forward: false,
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
            Row(
              children: [
                Text(
                  "Dark Mode",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).textTheme.bodyMedium!.color,
                  ),
                ),
                Expanded(child: SizedBox()),
                Switch(
                  value: SettingsCubit.instance.isDarkMode,
                  onChanged: (bool newVal) {
                    setState(() {
                      context.read<SettingsCubit>().toggleDarkMode();
                    });
                  },
                  activeColor: AppTheme.mainColor,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18), // تعديل المسافات هنا
      child: Divider(
        thickness: 1,
        height: 1,
        color: Colors.grey[300],
      ),
    );
  }
}
