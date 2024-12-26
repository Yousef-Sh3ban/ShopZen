import 'dart:core';

import 'package:animate_do/animate_do.dart';
import 'package:base/configurations/app_events.dart';
import 'package:base/configurations/app_states.dart';
import 'package:base/features/cart/ui/bloc/cart_cubit.dart';
import 'package:base/features/cart/ui/screen/cart_screen.dart';
import 'package:base/features/favorites/ui/screens/favorites_screen.dart';
import 'package:base/features/home_screen/domain/models/product_model.dart';
import 'package:base/features/home_screen/ui/blocs/home_bloc.dart';
import 'package:base/features/home_screen/ui/widget/categories_widget_loading.dart';
import 'package:base/features/home_screen/ui/widget/custom_bottom_navigationBar.dart';
import 'package:base/features/home_screen/ui/widget/banner_widget.dart';
import 'package:base/features/home_screen/ui/widget/categories_widget.dart';
import 'package:base/features/home_screen/ui/widget/deal_card_loading.dart';
import 'package:base/features/home_screen/ui/widget/hot_deals_widget.dart';
import 'package:base/features/home_screen/ui/widget/location_search_bar.dart';
import 'package:base/features/profile/ui/screen/profile_screen.dart';
import 'package:base/navigation/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreenContent(),
    const FavoritesScreen(),
    BlocProvider(
      create: (context) => CartCubit(),
      child: const CartScreen(),
    ),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: FadeInUpBig(
        duration: const Duration(seconds: 1),
        child: CustomBottomNavigationBar(
          selectedIndex: _selectedIndex,
          ontap: _onItemTapped,
        ),
      ),
    );
  }
}

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Account Page'));
  }
}

class HomeScreenContent extends StatefulWidget {
  const HomeScreenContent({super.key});

  @override
  State<HomeScreenContent> createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<HomeScreenContent> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<HomeBloc>().add(GetDataEvent(data: null));
      context.read<HomeBloc>().add(GetCategoriesEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            FadeInDown(
              from: 70,
              child: LocationSearchBar(
                ontap: () {
                  Navigator.pushNamed(context, AppRoutes.SearchScreen);
                },
              ),
            ),
            const SizedBox(height: 16),
            BlocBuilder<HomeBloc, AppStates>(
              buildWhen: (previous, current) {
                if (current is CategoriesState && previous is CategoriesState) {
                  //for better performance
                  return current.data != previous.data;
                }
                return current is CategoriesState;
              },
              builder: (context, state) {
                if (state is CategoriesState) {
                  return CategoriesWidget(response: state.data);
                } else {
                  return const CategoriesLoadingWidget();
                }
              },
            ),
            const SizedBox(height: 16),
            FadeInLeft(
                duration: const Duration(milliseconds: 700),
                from: 20,
                child: const BannerWidget()),
            const SizedBox(height: 8),
            FadeIn(
              duration: const Duration(milliseconds: 700),
              child: Center(
                child: SvgPicture.asset("assets/icons/ad_dots.svg"),
              ),
            ),
            const SizedBox(height: 16),
            BlocBuilder<HomeBloc, AppStates>(
              buildWhen: (previous, current) {
                if (current is LoadedState && previous is LoadedState) {
                  //for better performance
                  return current.data != previous.data;
                }
                return current is LoadedState || current is LoadingState;
              },
              builder: (context, state) {
                if (state is LoadingState) {
                  return DealCardLoading();
                } else if (state is LoadedState) {
                  final List<ProductModel> products =
                      state.data as List<ProductModel>;
                  return FadeIn(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RepaintBoundary(
                            child: HotDealsWidget(products: products)),
                        const SizedBox(height: 16),
                      ],
                    ),
                  );
                } else {
                  return const Center(child: Text("No data available."));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
