import 'dart:math';

import 'package:base/configurations/app_events.dart';
import 'package:base/configurations/app_states.dart';
import 'package:base/features/home_screen/domain/models/product_model.dart';
import 'package:base/features/home_screen/ui/blocs/home_bloc.dart';
import 'package:base/features/home_screen/ui/widget/custom_bottom_navigationBar.dart';
import 'package:base/features/home_screen/ui/widget/hot_deals_widget.dart';
import 'package:base/features/search%20_products/ui/widgets/custom_appBar.dart';
import 'package:base/features/search%20_products/ui/widgets/hot_deals_widget_search.dart';
import 'package:base/features/search%20_products/ui/widgets/location_search_bar_proudact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchProduact extends StatelessWidget {
  const SearchProduact({super.key, this.text});
  final String? text;

  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(GetDataEvent(data: null));
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 1,
        flexibleSpace: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              LocationSearchBarProudact(),
              SizedBox(
                height: 16,
              ),
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
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HotDealsWidgetSearch(products: products),
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
