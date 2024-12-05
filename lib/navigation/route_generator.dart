import 'package:base/configurations/app_states.dart';
import 'package:base/features/authentication/ui/blocs/login_bloc.dart';
import 'package:base/features/authentication/ui/blocs/signup_bloc.dart';
import 'package:base/features/authentication/ui/screens/login_default.dart';
import 'package:base/features/authentication/ui/screens/signup_default.dart';
import 'package:base/features/product_details/ui/blocs/product_details_bloc.dart';
import 'package:base/features/product_details/ui/screens/product_details_screen.dart';
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
            BlocProvider<ProductsSearchBloc>(create: (context) => ProductsSearchBloc()),
            BlocProvider<ProductsCategoriesBloc>(create: (context) => ProductsCategoriesBloc()),
          ],
          child: ProductsSearchScreen(),
        ),
      );

    case AppRoutes.loginDefault:
      return _createRoute(
        BlocProvider(
          create: (context) => LoginBloc(),//check this
          child: const LoginDefaultScreen(),
        ),
      );
    case AppRoutes.signupDefault:
      return _createRoute(
        BlocProvider(
          create: (context) => SignupBloc(),//check this
          child: const SignupDefaultScreen(),
        ),
      );
    default:
      return _createRoute(SizedBox());
  }
}
