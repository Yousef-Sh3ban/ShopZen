import 'package:base/configurations/app_theme.dart';
import 'package:base/features/home_screen/ui/widget/deal_card.dart';
import 'package:base/features/products_details/ui/blocs/product_details_cubit.dart';
import 'package:base/features/products_details/ui/screen/product_details_screen.dart';
import 'package:base/features/search_products/ui/blocs/search_cubit.dart';
import 'package:base/features/search_products/ui/blocs/search_state.dart';
import 'package:base/features/search_products/ui/widget/empty_search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cubit = SearchCubit.get(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        surfaceTintColor: Colors.white,
        title: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            String title = "Search Products";
            if (state is SearchLoaded) {
              title = "${state.products.length} Items Found";
            }
            return Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
        centerTitle: true,
        toolbarHeight: 60,
        automaticallyImplyLeading: false,
        elevation: 0.1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
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
              controller: controller,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: SvgPicture.asset(
                    "assets/icons/search.svg",
                  ),
                ),
                suffixIcon: IconButton(
                  icon: SvgPicture.asset("assets/icons/close.svg"),
                  onPressed: () {
                    if (controller.text.isNotEmpty) {
                      controller.clear();
                      cubit.clearSearch();
                    }
                  },
                ),
                hintText: 'Find your favorite items',
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFF4F48FF)),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFF4F48FF)),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFF4F48FF)),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFF4F48FF)),
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
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        childAspectRatio: screenWidth / screenHeight * 1.2,
                      ),
                      itemCount: state.products.length,
                      itemBuilder: (context, index) {
                        final product = state.products[index];
                        return InkWell(
                            child: DealCard(
                              id: product.id,
                              imageUrl: product.thumbnail,
                              title: product.title,
                              price: product.price,
                              oldPrice: product.oldPrice,
                              rating: product.rating,
                              reviewsCount: product.reviewsCount,
                              isFavorite: product.isFavorite,
                            ),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => BlocProvider(
                                    create: (context) => ProductDetailsCubit(),
                                    child: ProductDetailsScreen(
                                      id: product.id,
                                    ),
                                  ),
                                ),
                              );
                            });
                      },
                    );
                  }
                  return const Center(
                    child: Text(
                      'Start searching for products.',
                      style: TextStyle(
                          fontSize: 24,
                          color: AppTheme.darkPrimary,
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
