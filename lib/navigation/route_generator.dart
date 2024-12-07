import 'package:base/features/home_screen/ui/blocs/home_bloc.dart';
import 'package:base/features/home_screen/ui/screen/Home.dart';
import 'package:base/features/authentication/ui/screens/login.dart';
import 'package:base/features/authentication/ui/screens/login_default.dart';
import 'package:base/features/authentication/ui/screens/on_boarding.dart';
import 'package:base/features/authentication/ui/screens/splash.dart';

import 'package:base/features/product_details/ui/blocs/product_details_bloc.dart';
import 'package:base/features/product_details/ui/screens/product_details_screen.dart';
import 'package:base/navigation/app_routes.dart';
import 'package:base/network/network_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/products_search/ui/blocs/products_categories_bloc.dart';
import '../features/products_search/ui/blocs/products_search_bloc.dart';
import '../features/products_search/ui/screens/products_search_screen.dart';

_createRoute(Widget page) {
  return MaterialPageRoute(builder: (context) => page);
}

Route generateRoute(settings) {
  switch (settings.name) {
    case AppRoutes.Splash:
      return _createRoute(Splash());
    case AppRoutes.OnBoarding:
      return _createRoute(OnBoarding());
    case AppRoutes.Login:
      return _createRoute(Login());
    case AppRoutes.LoginDefaultScreen:
      return _createRoute(LoginDefaultScreen());
    case AppRoutes.Home:
      return _createRoute(
        BlocProvider(
          create: (context) => HomeBloc(),
          child: const HomeScreen(),
        ),
      );

    case AppRoutes.productDetails:
      return _createRoute(
        BlocProvider(
          create: (context) => ProductDetailsBloc(settings.arguments as String),
          child: const ProductDetailsScreen(),
        ),
      );
    case AppRoutes.main:
      return _createRoute(
        MultiBlocProvider(
          providers: [
            BlocProvider<ProductsSearchBloc>(
                create: (context) => ProductsSearchBloc()),
            BlocProvider<ProductsCategoriesBloc>(
                create: (context) => ProductsCategoriesBloc()),
          ],
          child: ProductsSearchScreen(),
        ),
      );

    default:
      return _createRoute(SizedBox());
  }
}
