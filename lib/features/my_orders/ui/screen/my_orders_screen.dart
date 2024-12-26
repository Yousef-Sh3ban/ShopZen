import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: FadeInDown(
          from: 50,
          child: Row(
            children: [
              const SizedBox(
                width: 30,
              ),
              InkWell(
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 18,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
        title: FadeInDown(
          from: 50,
          child: const Text(
            "My Orders",
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 24),
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}
