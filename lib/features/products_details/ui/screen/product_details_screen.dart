import 'dart:developer';

import 'package:base/configurations/app_states.dart';
import 'package:base/features/authentication/ui/widgets/login_bottom.dart';
import 'package:base/features/products_details/domain/models/product_details_model.dart';
import 'package:base/features/products_details/ui/blocs/product_details_cubit.dart';
import 'package:base/features/products_details/ui/widget/descreption_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductDetailsScreen extends StatelessWidget {
  final int id;
  const ProductDetailsScreen({super.key, required this.id});
  @override
  Widget build(BuildContext context) {
    var productDetailsCubit = BlocProvider.of<ProductDetailsCubit>(context);
    productDetailsCubit.getProductDetails(id);
    log("ProductDetailsScreen: $id");
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_ios_new,
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
            // log((state.data as ProductDetailsModel).title.toString());
            // log((state.data as ProductDetailsModel).category.toString());
            // log((state.data as ProductDetailsModel).description.toString());
            // log((state.data as ProductDetailsModel).discountPercentage.toString());
            // log((state.data as ProductDetailsModel).id.toString());
            // log((state.data as ProductDetailsModel).price.toString());
            // log((state.data as ProductDetailsModel).reviews.toString());
            // log((state.data as ProductDetailsModel).reviewsCount.toString());
            // log((state.data as ProductDetailsModel).stock.toString());
            ProductDetailsModel productDetails =
                (state.data as ProductDetailsModel);
            return ListView(
              children: [
                SizedBox(
                    height: 260,
                    child: Image.network(
                      productDetails.images[0],
                      fit: BoxFit.cover,
                    )),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: const SizedBox() // Image.network(""),
                              ),
                          const SizedBox(
                            width: 16,
                          ),
                          ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: const SizedBox() //Image.network(""),
                              ),
                          const SizedBox(
                            width: 16,
                          ),
                          ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: const SizedBox() //Image.network(""),
                              ),
                          const SizedBox(
                            width: 16,
                          ),
                          ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: const SizedBox() // Image.network(""),
                              ),
                          const SizedBox(
                            width: 16,
                          ),
                          ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: const SizedBox() //Image.network(""),
                              ),
                          const SizedBox(
                            width: 16,
                          ),
                        ],
                      ),
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
                                color: const Color(0xFF68656E),
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
                SizedBox(
                  height: 12,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: LoginBottom(
                    color: Color(0xFF6A70FF),
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
