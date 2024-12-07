import 'package:base/features/home_screen/ui/widget/DealCard.dart';
import 'package:flutter/widgets.dart';

class HotDealsWidget extends StatelessWidget {
  List<DealCard> dealCaredList = [
    DealCard(
        imageUrl: "https://via.placeholder.com/100",
        title: 'Portable Neck Fan Hands Free Fan',
        price: 40.0,
        oldPrice: 60.0,
        rating: 4.8,
        reviewsCount: 120,
        isFavorite: true),
    DealCard(
        imageUrl: "https://via.placeholder.com/100",
        title: 'Portable Neck Fan Hands Free Fan',
        price: 40.0,
        oldPrice: 60.0,
        rating: 4.8,
        reviewsCount: 120,
        isFavorite: true),
    DealCard(
        imageUrl: "https://via.placeholder.com/100",
        title: 'Portable Neck Fan Hands Free Fan',
        price: 40.0,
        oldPrice: 60.0,
        rating: 4.8,
        reviewsCount: 120,
        isFavorite: true),
    DealCard(
        imageUrl: "https://via.placeholder.com/100",
        title: 'Portable Neck Fan Hands Free Fan',
        price: 40.0,
        oldPrice: 60.0,
        rating: 4.8,
        reviewsCount: 120,
        isFavorite: true),
    DealCard(
        imageUrl: "https://via.placeholder.com/100",
        title: 'Portable Neck Fan Hands Free Fan',
        price: 40.0,
        oldPrice: 60.0,
        rating: 4.8,
        reviewsCount: 120,
        isFavorite: true),
    DealCard(
        imageUrl: "https://via.placeholder.com/100",
        title: 'Portable Neck Fan Hands Free Fan',
        price: 40.0,
        oldPrice: 60.0,
        rating: 4.8,
        reviewsCount: 120,
        isFavorite: true),
    DealCard(
        imageUrl: "https://via.placeholder.com/100",
        title: 'Portable Neck Fan Hands Free Fan',
        price: 40.0,
        oldPrice: 60.0,
        rating: 4.8,
        reviewsCount: 120,
        isFavorite: true),
    DealCard(
        imageUrl: "https://via.placeholder.com/100",
        title: 'Portable Neck Fan Hands Free Fan',
        price: 40.0,
        oldPrice: 60.0,
        rating: 4.8,
        reviewsCount: 120,
        isFavorite: true),
  ];
  HotDealsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hot Deals",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 0.7,
          ),
          itemCount: dealCaredList.length,
          itemBuilder: (context, index) {
            return dealCaredList[index];
          },
        ),
      ],
    );
  }
}
