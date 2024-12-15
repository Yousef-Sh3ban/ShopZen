import 'package:base/features/authentication/ui/widgets/custom_login_button.dart';
import 'package:base/features/authentication/ui/widgets/login_bottom.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_ios_new,
        ),
        title: const Text("Product Details"),
      ),
      body: ListView(
        children: [
          Image.network(""),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(""),
              ),
              const SizedBox(
                width: 16,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(""),
              ),
              const SizedBox(
                width: 16,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(""),
              ),
              const SizedBox(
                width: 16,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(""),
              ),
              const SizedBox(
                width: 16,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(""),
              ),
              const SizedBox(
                width: 16,
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          const Text(
            "",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
          ),
          const Row(
            children: [
              Text("\$"),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: const Color(0xFFE0E0E5),
          ),
          const Expanded(child: SizedBox()),
          const LoginBottom(
            text: "Add to Cart",
          )
        ],
      ),
    );
  }
}
