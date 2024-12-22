import 'package:base/features/cart/ui/bloc/cart_cubit.dart';
import 'package:base/features/cart/ui/screen/cart_screen.dart';
import 'package:base/features/chek_out/ui/screen/address_page.dart';
import 'package:base/features/chek_out/ui/screen/chek_out_page.dart';
import 'package:base/features/chek_out/ui/screen/congration_page.dart';
import 'package:base/search_products_Ecommerc/ui/blocs/search_cubit.dart';
import 'package:base/search_products_Ecommerc/ui/screen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:base/features/authentication/ui/screens/login.dart';
import 'package:base/features/authentication/ui/screens/login_default.dart';
import 'package:base/features/authentication/ui/screens/on_boarding.dart';
import 'package:base/features/authentication/ui/screens/splash.dart';
import 'package:base/features/home_screen/ui/blocs/home_bloc.dart';
import 'package:base/features/home_screen/ui/screen/Home.dart';
import 'package:base/features/product_details/ui/blocs/product_details_bloc.dart';
import 'package:base/features/product_details/ui/screens/product_details_screen.dart';

import 'package:base/navigation/app_routes.dart';

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

    case AppRoutes.SearchScreen:
      return _createRoute(BlocProvider(
        create: (context) => SearchCubit(),
        child: SearchScreen(),
      ));
    case AppRoutes.CartScreen:
      return _createRoute(BlocProvider(
        create: (context) => CartCubit(),
        child: CartScreen(),
      ));
    case AppRoutes.AddressPage:
      return _createRoute(AddressPage());

    case AppRoutes.CongratulationsPage:
      return _createRoute(CongratulationsPage());
    case AppRoutes.CheckoutPage:
      return _createRoute(CheckoutPage());

    default:
      return _createRoute(SizedBox());
  }
}
