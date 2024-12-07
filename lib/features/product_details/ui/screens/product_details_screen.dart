import 'package:base/configurations/app_states.dart';
import 'package:base/features/product_details/domain/models/product_details.dart';
import 'package:base/features/product_details/ui/blocs/product_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductDetailsBloc, AppStates>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ErrorState)
            return const Center(child: Text("state.error"));
          else if (state is LoadedState) {
            ProductDetails productDetails = state.data as ProductDetails;
            return Column(
              children: [
                Image.network(productDetails.imageUrls.first, width: MediaQuery.of(context).size.width, height: 350, fit: BoxFit.fill),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                productDetails.name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text("\$${productDetails.price}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.green))
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(productDetails.description),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
