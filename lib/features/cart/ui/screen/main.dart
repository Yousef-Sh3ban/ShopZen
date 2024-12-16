// import 'package:flutter/material.dart';
import 'package:base/features/cart/ui/bloc/cart_cubit.dart';
import 'package:base/features/cart/ui/screen/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Cart',
      home: BlocProvider(
        create: (_) => CartCubit(),
        child: CartScreen(),
      ),
    );
  }
}
