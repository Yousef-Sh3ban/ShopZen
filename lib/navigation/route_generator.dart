import 'package:base/features/cart/ui/bloc/cart_cubit.dart';
import 'package:base/features/cart/ui/screen/cart_screen.dart';
import 'package:base/features/chek_out/ui/screen/address_page.dart';
import 'package:base/features/chek_out/ui/screen/chek_out_page.dart';
import 'package:base/features/chek_out/ui/screen/congration_page.dart';
import 'package:base/features/notifaction/ui/blocs/notifaction_bloc.dart';
import 'package:base/features/notifaction/ui/screen/notifaction_screen.dart';

import 'package:base/search_products_Ecommerc/ui/blocs/search_cubit.dart';
import 'package:base/search_products_Ecommerc/ui/screen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:base/features/authentication/ui/blocs/login_bloc.dart';
import 'package:base/features/authentication/ui/blocs/signup_bloc.dart';
import 'package:base/features/favorites/ui/screens/favorites_screen.dart';
import 'package:base/features/home_screen/ui/blocs/home_bloc.dart';
import 'package:base/features/home_screen/ui/screen/home_screen.dart';
import 'package:base/features/authentication/ui/screens/login.dart';
import 'package:base/features/authentication/ui/screens/login_default.dart';
import 'package:base/features/authentication/ui/screens/on_boarding.dart';
import 'package:base/features/authentication/ui/screens/signup_default.dart';
import 'package:base/features/authentication/ui/screens/singup.dart';
import 'package:base/features/authentication/ui/screens/splash.dart';
import 'package:base/features/home_screen/ui/blocs/home_bloc.dart';

import 'package:base/navigation/app_routes.dart';
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
    case AppRoutes.favorites:
      return _createRoute(FavoritesScreen());
    case AppRoutes.notifaction:
      return _createRoute(
        BlocProvider(
          create: (context) => NotifactionBloc(),
          child: const NotifactionScreen(),
        ),
      );
    case AppRoutes.splash:
      return _createRoute(const Splash());
    case AppRoutes.onBoarding:
      return _createRoute(const OnBoarding());
    case AppRoutes.login:
      return _createRoute(const Login());
    case AppRoutes.signup:
      return _createRoute(const SingupScreen());
    case AppRoutes.loginDefaultScreen:
      return _createRoute(
        BlocProvider(
          create: (context) => LoginBloc(),
          child: const LoginDefaultScreen(),
        ),
      );
    case AppRoutes.signupDefaultScreen:
      return _createRoute(
        BlocProvider(
          create: (context) => SignupBloc(),
          child: const SignupDefaultScreen(),
        ),
      );
    case AppRoutes.home:
      return _createRoute(
        BlocProvider(
          create: (context) => HomeBloc(),
          child: const HomeScreen(),
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
      return _createRoute(const SizedBox());
  }
}
