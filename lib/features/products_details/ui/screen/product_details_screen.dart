import 'dart:developer';

import 'package:base/configurations/app_states.dart';
import 'package:base/features/authentication/ui/widgets/login_bottom.dart';
import 'package:base/features/cart/domain/models/cart_item.dart';
import 'package:base/features/products_details/domain/models/product_details_model.dart';
import 'package:base/features/products_details/ui/blocs/product_details_cubit.dart';
import 'package:base/features/products_details/ui/widget/descreption_widget.dart';
import 'package:base/features/products_details/ui/widget/favorite_icon_widget.dart';
import 'package:base/features/products_details/ui/widget/product_image_widget.dart';
import 'package:base/handlers/cart_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int id;
  const ProductDetailsScreen({super.key, required this.id});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var productDetailsCubit = BlocProvider.of<ProductDetailsCubit>(context);
    productDetailsCubit.getProductDetails(widget.id);
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
        title: const Text("Product Details"),
      ),
      body: BlocBuilder<ProductDetailsCubit, AppStates>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ErrorState) {
            return const Center(
              child: Text("Error"),
            );
          } else if (state is LoadedState) {
            ProductDetailsModel productDetails =
                (state.data as ProductDetailsModel);
            return ListView(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 260,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        productDetails.images[0],
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 12,
                      right: 32,
                      child: Container(
                          height: 24,
                          width: 24,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            shape: BoxShape.rectangle,
                          ),
                          child: FavoriteIcon(
                            productDetails: productDetails,
                            productId: productDetails.id,
                          )),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      ProductImageWidget(images: productDetails.images),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        productDetails.title,
                        style: const TextStyle(
                            fontFamily: "Satoshi",
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Text(
                            "${productDetails.price}\$",
                            style: const TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 20),
                          ),
                          const Expanded(child: SizedBox()),
                          SvgPicture.asset("assets/icons/star.svg"),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(productDetails.rating.toString()),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            "(${productDetails.reviewsCount} Review)",
                            style: const TextStyle(
                                color: Color(0xFF68656E),
                                fontWeight: FontWeight.w400,
                                fontSize: 12),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
                DescreptionWidget(
                  description: productDetails.description,
                  reviews: productDetails.reviews,
                ),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: LoginBottom(
                    ontap: () {
                      final dbHelper = CartDatabaseHelper.instance;
                      dbHelper.insertCartItem(CartItem(
                          id: productDetails.id,
                          title: productDetails.title,
                          image: productDetails.images[0],
                          price: productDetails.price));
                      final snackBar = SnackBar(
                        elevation: 0,
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                        padding:
                            const EdgeInsets.symmetric(horizontal: 0, vertical: 13),
                        duration: const Duration(seconds: 10),
                        content: AwesomeSnackbarContent(
                          color: const Color(0xFF452CE8),
                          title: 'Yay!',
                          messageTextStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                          message:
                              ' ${productDetails.title} is now in your cart! 🛒',
                          contentType: ContentType.success,
                        ),
                      );

                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(snackBar);
                    },
                    color: const Color(0xFF6A70FF),
                    text: "Add to Cart",
                  ),
                )
              ],
            );
          } else {
            return const Center(
              child: Text("NO DATA"),
            );
          }
        },
      ),
    );
  }
}
