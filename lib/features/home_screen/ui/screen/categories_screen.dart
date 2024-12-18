import 'dart:developer';

import 'package:base/configurations/app_states.dart';
import 'package:base/features/home_screen/domain/models/product_model.dart';
import 'package:base/features/home_screen/ui/blocs/category_cubit.dart';
import 'package:base/features/home_screen/ui/widget/deal_card.dart';
import 'package:base/features/home_screen/ui/widget/hot_deals_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesScreen extends StatelessWidget {
  String title;
  String categoryurl;

  CategoriesScreen({super.key, required this.categoryurl, required this.title});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    var categoryCubit = BlocProvider.of<CategoryCubit>(context);
    categoryCubit.getCategoriesProducts(categoryurl);
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: Row(
          children: [
            const SizedBox(
              width: 30,
            ),
            InkWell(
              child: const Icon(
                Icons.arrow_back_ios_new,
                size: 18,
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<CategoryCubit, AppStates>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ErrorState) {
            return const Center(child: Text("Error happend "));
          } else if (state is CategoryProductsState) {
            List<DealCard> dealCaredList = modelingProductList((state.data));
            return SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${dealCaredList.length} Items",
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF68656E)
                                ),
                          ),
                          const SizedBox(height: 28)
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        childAspectRatio: screenWidth / screenHeight * 1.2,
                      ),
                      itemCount: dealCaredList.length,
                      itemBuilder: (context, index) {
                        return dealCaredList[index];
                      },
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: Text("No data to show"));
          }
        },
      ),
    );
  }
}
