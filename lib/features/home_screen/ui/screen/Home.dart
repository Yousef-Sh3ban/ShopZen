import 'dart:developer';

import 'package:base/configurations/app_events.dart';
import 'package:base/configurations/app_states.dart';
import 'package:base/features/home_screen/domain/models/product_model.dart';
import 'package:base/features/home_screen/ui/blocs/home_bloc.dart';
import 'package:base/features/home_screen/ui/widget/BannerWidget.dart';
import 'package:base/features/home_screen/ui/widget/CategoriesWidget.dart';
import 'package:base/features/home_screen/ui/widget/Custom_Bottom_NavigationBar.dart';
import 'package:base/features/home_screen/ui/widget/DealCard.dart';
import 'package:base/features/home_screen/ui/widget/HotDealsWidget.dart';
import 'package:base/features/home_screen/ui/widget/LocationSearchBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(GetDataEvent(data: null));

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              LocationSearchBar(),
              const SizedBox(height: 16),
              CategoriesWidget(),
              const SizedBox(height: 16),
              BlocConsumer<HomeBloc, AppStates>(
                listener: (context, state) {
                  if (state is ErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.errorMessage)),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is LoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is LoadedState) {
                    final List<ProductModel> products =
                        state.data as List<ProductModel>;
                    log(products.toString());
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HotDealsWidget(products: products),
                        const SizedBox(height: 16),
                      ],
                    );
                  } else {
                    return const Center(child: Text("No data available."));
                  }
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
