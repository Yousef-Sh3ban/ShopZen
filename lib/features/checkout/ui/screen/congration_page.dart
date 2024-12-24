import 'package:base/features/cart/ui/widget/custom_Bottom.dart';
import 'package:flutter/material.dart';

class CongratulationsPage extends StatelessWidget {
  const CongratulationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle, size: 100, color: Colors.green),
              const SizedBox(height: 16),
              const Text(
                'Congratulations!',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text('Your order has been placed successfully.'),
              const SizedBox(height: 16),
              CustomBottom(
                  width: double.infinity,
                  height: 50,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  text: 'Back to Checkout'),
            ],
          ),
        ),
      ),
    );
  }
}
