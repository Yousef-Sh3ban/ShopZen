import 'package:base/features/cart/ui/bloc/cart_cubit.dart';
import 'package:base/features/cart/ui/screen/cart_screen.dart';
import 'package:base/features/checkout/ui/screen/address_page.dart';
import 'package:base/features/checkout/ui/screen/checkout_page.dart';
import 'package:base/features/checkout/ui/widget/congration_dilog.dart';
import 'package:base/features/my_orders/ui/blocs/orders_bloc.dart';
import 'package:base/features/my_orders/ui/screen/my_order_screen.dart';
import 'package:base/features/notifaction/ui/blocs/notifaction_bloc.dart';
import 'package:base/features/notifaction/ui/screen/notifaction_screen.dart';

import 'package:base/features/profile/ui/screen/account_screen.dart';
import 'package:base/features/profile/ui/screen/profile_notfcation.dart';

import 'package:base/features/profile/ui/screen/profile_screen.dart';

import 'package:base/navigation/app_routes.dart';

import 'package:base/features/search_products_Ecommerc/ui/blocs/search_cubit.dart';
import 'package:base/features/search_products_Ecommerc/ui/screen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:base/features/authentication/ui/blocs/login_bloc.dart';
import 'package:base/features/authentication/ui/blocs/signup_bloc.dart';
import 'package:base/features/home_screen/ui/blocs/home_bloc.dart';
import 'package:base/features/home_screen/ui/screen/home_screen.dart';
import 'package:base/features/authentication/ui/screens/login.dart';
import 'package:base/features/authentication/ui/screens/login_default.dart';
import 'package:base/features/authentication/ui/screens/on_boarding.dart';
import 'package:base/features/authentication/ui/screens/signup_default.dart';
import 'package:base/features/authentication/ui/screens/singup.dart';
import 'package:base/features/authentication/ui/screens/splash.dart';

_createRoute(Widget page) {
  return MaterialPageRoute(builder: (context) => page);
}

Route generateRoute(settings) {
  switch (settings.name) {
    case AppRoutes.notifaction:
      return _createRoute(
        BlocProvider(
          create: (context) => NotifactionBloc(),
          child: const NotifactionScreen(),
        ),
      );
    case AppRoutes.orders:
      return _createRoute(BlocProvider(
        create: (context) => OrderCubit(),
        child: const MyOrderScreen(),
      ));
    case AppRoutes.splash:
      return _createRoute(const Splash());
    case AppRoutes.profile:
      return _createRoute(ProfileScreen());
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
      return _createRoute(
        BlocProvider<CartCubit>(
          create: (context) => CartCubit(),
          child: const CartScreen(),
        ),
      );

    case AppRoutes.AddressPage:
      return _createRoute(const AddressPage());

    case AppRoutes.CheckoutPage:
      return _createRoute(const CheckoutPage());
    case AppRoutes.AccountScreen:
      return _createRoute(AccountScreen());
    case AppRoutes.NotificationSettings:
      return _createRoute(NotificationSettings());
    case AppRoutes.ProfileScreen:
      return _createRoute(ProfileScreen());
    case AppRoutes.MyOrderScreen:
      return _createRoute(BlocProvider<OrderCubit>(
          create: (context) => OrderCubit(), child: const MyOrderScreen()));

    default:
      return _createRoute(const SizedBox());
  }
}
