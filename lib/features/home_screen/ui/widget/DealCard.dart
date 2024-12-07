// //
// import 'package:flutter/material.dart';

// class DealCard extends StatelessWidget {
//   final String imageUrl;
//   final String title;
//   final double price;
//   final double oldPrice;
//   final double rating;
//   final int reviewsCount;
//   final bool isFavorite;

//   const DealCard({
//     required this.imageUrl,
//     required this.title,
//     required this.price,
//     required this.oldPrice,
//     required this.rating,
//     required this.reviewsCount,
//     required this.isFavorite,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 180,
//       margin: EdgeInsets.all(8),
//       padding: EdgeInsets.all(8),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         //border: Border.all(color: Colors.purple, width: 1),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.2),
//             blurRadius: 10,
//             offset: Offset(0, 5),
//           ),
//         ],
//       ),
//       child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // الصورة وأيقونة المفضلة
//             Stack(
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(12),
//                   child: Image.network(
//                     imageUrl,
//                     height: 120,
//                     width: double.infinity,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 Positioned(
//                   top: 8,
//                   right: 8,
//                   child: Container(
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: Colors.white,
//                     ),
//                     child: IconButton(
//                       icon: Icon(Icons.favorite_border),
//                       onPressed: () {},
//                       iconSize: 20,
//                       color: Colors.red,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 8),
//             // اسم المنتج
//             Text(
//               title,
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black87,
//               ),
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//             ),
//             SizedBox(height: 8),
//             // السعر
//             Row(
//               children: [
//                 Text(
//                   "\$$price",
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black87,
//                   ),
//                 ),
//                 SizedBox(width: 8),
//                 Text(
//                   "\$$oldPrice",
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: Colors.grey,
//                     decoration: TextDecoration.lineThrough,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 8),
//             // التقييم
//             Row(
//               children: [
//                 Icon(Icons.star, color: Colors.amber, size: 16),
//                 SizedBox(width: 4),
//                 Text(
//                   "$rating",
//                   style: TextStyle(fontSize: 14, color: Colors.black87),
//                 ),
//                 SizedBox(width: 4),
//                 Text(
//                   "($reviewsCount)",
//                   style: TextStyle(fontSize: 12, color: Colors.grey),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class DealCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double price;
  final double oldPrice;
  final double rating;
  final int reviewsCount;
  final bool isFavorite;

  const DealCard({
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.oldPrice,
    required this.rating,
    required this.reviewsCount,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  imageUrl,
                  height: 160,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 7,
                right: 7,
                child: Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  child: IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                    ),
                    onPressed: () {},
                    iconSize: 12,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Text(
                "\$$price",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(width: 8),
              Text(
                "\$$oldPrice",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.star, color: Colors.amber, size: 16),
              SizedBox(width: 4),
              Text(
                "$rating",
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
              SizedBox(width: 4),
              Text(
                "($reviewsCount)",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
