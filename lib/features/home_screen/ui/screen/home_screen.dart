import 'package:base/configurations/app_events.dart';
import 'package:base/configurations/app_states.dart';
import 'package:base/features/favorites/ui/screens/favorites_screen.dart';
import 'package:base/features/home_screen/domain/models/product_model.dart';
import 'package:base/features/home_screen/ui/blocs/home_bloc.dart';
import 'package:base/features/home_screen/ui/widget/Custom_Bottom_NavigationBar.dart';
import 'package:base/features/home_screen/ui/widget/banner_widget.dart';
import 'package:base/features/home_screen/ui/widget/categories_widget.dart';
import 'package:base/features/home_screen/ui/widget/hot_deals_widget.dart';
import 'package:base/features/home_screen/ui/widget/location_search_bar.dart';
import 'package:flutter/material.dart'; 
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Track the selected index for the navigation bar

  // List of screens for navigation
  final List<Widget> _screens = [
    const HomeScreenContent(), // Home screen widget (current screen)
    FavoritesScreen(), // Saved screen widget
    CartPage(), // Cart screen widget
    AccountPage(), // Account screen widget
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screens[_selectedIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        ontap: _onItemTapped, // Pass function to handle item tap
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Cart Page'));
  }
}

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Account Page'));
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
    });
  }

  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(GetDataEvent(data: null));
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            LocationSearchBar(),
            const SizedBox(height: 16),
            CategoriesWidget(),
            const SizedBox(height: 16),
            const BannerWidget(),
            const SizedBox(height: 8),
            Center(
              child: SvgPicture.asset("assets/icons/ad_dots.svg"),
            ),
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
    );
  }
}
