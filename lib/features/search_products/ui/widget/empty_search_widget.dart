import 'package:base/configurations/app_theme.dart';
import 'package:flutter/material.dart';

class EmptySearchWidget extends StatelessWidget {
  const EmptySearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/Search-rafiki 1.png",
              ),
              const SizedBox(height: 64),
              const Text(
                'No Result Found!',
                style: TextStyle(
                    fontSize: 24,
                    color: AppTheme.darkPrimary,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
