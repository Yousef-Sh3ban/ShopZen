import 'package:flutter/material.dart';

class EmptySearchWidget extends StatelessWidget {
  const EmptySearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
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
                color: Color(0xff323135),
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
