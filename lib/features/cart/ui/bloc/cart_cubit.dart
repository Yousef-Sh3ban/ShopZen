import 'package:base/features/cart/domain/models/cart_item.dart';
import 'package:base/handlers/cart_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartLoading()) {
    getCartItems();
  }
  final dbHelper = CartDatabaseHelper();

  Future<void> getCartItems() async {
    final List<CartItem> _data = await dbHelper.getCartItems();
    if (_data.isEmpty) {
      emit(CartEmpty());
    } else {
      emit(CartLoaded(items: _data));
    }
  }

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

  Future<void> removeItem(int id) async {
    await dbHelper.deleteCartItem(id);
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
