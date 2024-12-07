// import 'dart:developer';

// import 'package:base/features/home_screen/domain/models/product_model.dart';
// import 'package:base/features/home_screen/ui/widget/DealCard.dart';
// import 'package:flutter/widgets.dart';

// class HotDealsWidget extends StatelessWidget {
//   List<ProductModel> products;
//   HotDealsWidget({super.key, required this.products});
//   @override
//   Widget build(BuildContext context) {
//     List<DealCard> dealCaredList = modelingProductList(products);
//     log("number of elemnts in the list is :");
//     log(dealCaredList[1].title.toString());
//     return Column(
//       children: [
//         const Text(
//           "Hot Deals",
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 8),
//         Row(
//           children: [
//             dealCaredList[0],
//             const SizedBox(
//               width: 15,
//             ),
//             dealCaredList[1],
//           ],
//         ),
//         // const SizedBox(
//         //   height: 24,
//         // ),
//         // Row(
//         //   children: [
//         //     dealCaredList[2],
//         //     const SizedBox(
//         //       width: 15,
//         //     ),
//         //     dealCaredList[3],
//         //   ],
//         // ),
//         // const SizedBox(
//         //   height: 24,
//         // ),
//         // Row(
//         //   children: [
//         //     dealCaredList[4],
//         //     const SizedBox(
//         //       width: 15,
//         //     ),
//         //     dealCaredList[5],
//         //   ],
//         // ),
//         // const SizedBox(
//         //   height: 24,
//         // ),
//         // Row(
//         //   children: [
//         //     dealCaredList[6],
//         //     const SizedBox(
//         //       width: 15,
//         //     ),
//         //     dealCaredList[7],
//         //   ],
//         // ),
//         // const SizedBox(
//         //   height: 24,
//         // ),
//         // Row(
//         //   children: [
//         //     dealCaredList[8],
//         //     const SizedBox(
//         //       width: 15,
//         //     ),
//         //     dealCaredList[9],
//         //   ],
//         // ),
//       ],
//     );
//   }
// }

// List<DealCard> modelingProductList(List<ProductModel> products) {
//   List<DealCard> data = [];
//   for (int i = 0; i < products.length; i++) {
//     log(products[i].imageUrl);
//     log(products[i].title);
//     log(products[i].price.toString());
//     log(products[i].oldPrice.toString());
//     log(products[i].rating.toString());
//     log(products[i].reviewsCount.toString());
//     data.add(
//       DealCard(
//           imageUrl: products[i].imageUrl ?? "no image",
//           title: products[i].title ?? "Unknown title",
//           price: products[i].price ?? 0.00,
//           oldPrice: products[i].oldPrice ?? 0.00,
//           rating: products[i].rating ?? 0.00,
//           reviewsCount: products[i].reviewsCount ?? 0,
//           isFavorite: false),
//     );
//   }
//   log("i will return now the data after modeling it ");
//   return data;
// }
