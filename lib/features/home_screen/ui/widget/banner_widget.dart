import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _AdBunner(
            imageUrl: "assets/images/ad0.png",
          ),
          SizedBox(
            width: 20,
          ),
          _AdBunner(
            imageUrl: "assets/images/ad1.jpg",
          ),
          SizedBox(
            width: 20,
          ),
          _AdBunner(
            imageUrl: "assets/images/ad2.jpg",
          ),
          SizedBox(
            width: 20,
          ),
          _AdBunner(
            imageUrl: "assets/images/ad3.jpg",
          ),
          SizedBox(
            width: 20,
          ),
          _AdBunner(
            imageUrl: "assets/images/ad4.jpg",
          ),
          SizedBox(
            width: 20,
          ),
          _AdBunner(
            imageUrl: "assets/images/ad5.jpg",
          ),          
        ],
      ),
    );
  }
}

class _AdBunner extends StatelessWidget {
  const _AdBunner({required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width - 32,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
