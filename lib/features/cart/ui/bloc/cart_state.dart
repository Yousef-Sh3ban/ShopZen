import 'package:base/features/cart/domain/models/cart_item.dart';

abstract class CartState {}

class CartLoaded extends CartState {
  final List<CartItem> items;
  double get totalAmount =>
      items.fold(0, (total, item) => total + (item.price * item.quantity));

  CartLoaded({required this.items});
}

class CartEmpty extends CartState {}
