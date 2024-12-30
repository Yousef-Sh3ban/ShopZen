// import 'package:base/features/home_screen/domain/models/product_model.dart';
// import 'package:base/features/products_details/ui/blocs/product_details_cubit.dart';
// import 'package:base/features/products_details/ui/screen/product_details_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class ProductCard extends StatefulWidget {
//   final ProductModel product;

//   const ProductCard({super.key, required this.product});

//   @override
//   State<ProductCard> createState() => _ProductCardState();
// }

// class _ProductCardState extends State<ProductCard> {
//   bool isFavorite = false;

//   @override
//   Widget build(BuildContext context) {
//           // log("asdsdm,nflkaksdjkfnbjsaldfjnnevagetiowjaes");
//     return InkWell(
//         child: Container(
//           padding: const EdgeInsets.all(8),
//           decoration: BoxDecoration(
//             // color: Colors.white,
//             borderRadius: BorderRadius.circular(12),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.2),
//                 blurRadius: 8,
//                 offset: const Offset(0, 4),
//               ),
//             ],
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Stack(
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(8),
//                     child: Image.network(
//                       widget.product.imageUrl,
//                       height: 100,
//                       width: double.infinity,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   Positioned(
//                     top: 8,
//                     right: 8,
//                     child: GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           isFavorite = !isFavorite;
//                         });
//                       },
//                       child: Container(
//                         padding: const EdgeInsets.all(4),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           shape: BoxShape.rectangle,
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black.withOpacity(0.1),
//                               blurRadius: 4,
//                             ),
//                           ],
//                         ),
//                         child: Icon(
//                           isFavorite ? Icons.favorite : Icons.favorite_border,
//                           color: isFavorite ? Colors.red : Colors.grey,
//                           size: 15,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 8),
//               Text(
//                 widget.product.title,
//                 style:
//                     const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//               ),
//               const SizedBox(height: 4),
//               Row(
//                 children: [
//                   Text(
//                     "\$${widget.product.price.toStringAsFixed(2)}",
//                     style: const TextStyle(fontSize: 14, color: Colors.green),
//                   ),
//                   const SizedBox(width: 8),
//                   Text(
//                     "\$${widget.product.oldPrice.toStringAsFixed(2)}",
//                     style: const TextStyle(
//                       fontSize: 14,
//                       color: Colors.grey,
//                       decoration: TextDecoration.lineThrough,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 4),
//               Row(children: [
//                 SvgPicture.asset(
//                   "assets/icons/star.svg",
//                   height: 21.5,
//                   width: 21.5,
//                 ),
//                 const SizedBox(width: 8),
//                 Text(
//                   widget.product.rating.toString(),
//                   style: const TextStyle(fontSize: 14),
//                 ),
//               ]),
//             ],
//           ),
//         ),
//         onTap: () {
//           Navigator.of(context).push(
//             MaterialPageRoute(
//               builder: (context) => BlocProvider(
//                 create: (context) => ProductDetailsCubit(),
//                 child: ProductDetailsScreen(
//                   id: widget.product.id,
//                 ),
//               ),
//             ),
//           );
//         });
//   }
// }
