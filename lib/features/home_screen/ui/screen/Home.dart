import 'package:base/features/home_screen/ui/widget/BannerWidget.dart';
import 'package:base/features/home_screen/ui/widget/CategoriesWidget.dart';
import 'package:base/features/home_screen/ui/widget/Custom_Bottom_NavigationBar.dart';
import 'package:base/features/home_screen/ui/widget/HotDealsWidget.dart';
import 'package:base/features/home_screen/ui/widget/LocationSearchBar.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LocationSearchBar(),
              SizedBox(height: 16),
              CategoriesWidget(),
              SizedBox(height: 16),
              BannerWidget(),
              SizedBox(height: 16),
              HotDealsWidget(),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
