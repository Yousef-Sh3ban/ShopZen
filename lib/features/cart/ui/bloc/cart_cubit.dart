import 'package:base/features/cart/domain/models/cart_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartLoaded(items: _dummyData));

  static List<CartItem> _dummyData = [
    CartItem(
      id: 1,
      title: 'Bluetooth Headphone',
      image: 'assets/images/ad3.jpg',
      price: 40.50,
      quantity: 1,
    ),
    CartItem(
      id: 2,
      title: 'Summer Dress',
      image: 'assets/images/ad3.jpg',
      price: 100.99,
      quantity: 1,
    ),
    CartItem(
      id: 3,
      title: 'Women T-Shirt',
      image: 'assets/images/ad3.jpg',
      price: 30.99,
      quantity: 1,
    ),
  ];

  void updateQuantity(int id, bool increase) {
    final currentState = state as CartLoaded;
    final updatedItems = currentState.items.map((item) {
      if (item.id == id) {
        item.quantity += increase ? 1 : -1;
        if (item.quantity < 1) item.quantity = 1;
      }
      return item;
    }).toList();

    emit(CartLoaded(items: updatedItems));
  }

  void removeItem(int id) {
    final currentState = state as CartLoaded;
    final updatedItems =
        currentState.items.where((item) => item.id != id).toList();

    if (updatedItems.isEmpty) {
      emit(CartEmpty());
    } else {
      emit(CartLoaded(items: updatedItems));
    }
  }
}
