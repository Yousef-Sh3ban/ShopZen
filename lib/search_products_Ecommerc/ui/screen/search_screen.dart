import 'package:base/search_products_Ecommerc/ui/blocs/search_cubit.dart';
import 'package:base/search_products_Ecommerc/ui/blocs/search_state.dart';
import 'package:base/search_products_Ecommerc/ui/widget/EmptySearchWidget.dart';
import 'package:base/search_products_Ecommerc/ui/widget/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = SearchCubit.get(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            String title = "Search Products";
            if (state is SearchLoaded) {
              title = "${state.products.length} Items Found";
            }
            return Center(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
        ),
        toolbarHeight: 60,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0.1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: SvgPicture.asset(
                    "assets/icons/search.svg",
                  ),
                ),
                suffixIcon: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: SvgPicture.asset("assets/icons/close.svg"),
                ),
                hintText: 'Find your favorite items',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onChanged: (value) {
                cubit.searchProducts(value);
              },
            ),
            const SizedBox(height: 16),
            Expanded(
              child: BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state is SearchLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is SearchError) {
                    return Center(child: Text(state.message));
                  } else if (state is SearchEmpty) {
                    return const EmptySearchWidget();
                  } else if (state is SearchLoaded) {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.75,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemCount: state.products.length,
                      itemBuilder: (context, index) {
                        final product = state.products[index];
                        return ProductCard(product: product);
                      },
                    );
                  }
                  return const Center(
                    child: Text(
                      'Start searching for products.',
                      style: TextStyle(
                          fontSize: 24,
                          color: Color(0xff323135),
                          fontWeight: FontWeight.w400),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
