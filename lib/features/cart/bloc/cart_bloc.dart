import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grocery_app/data/cart_items.dart';
import 'package:grocery_app/features/home/models/data_model.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveFromCart>(cartRemoveFromCart);
  }

  FutureOr<void> cartInitialEvent(
    CartInitialEvent event,
    Emitter<CartState> emit,
  ) {
    emit(CartSuccessState(cartItems: cartItems));
  }

  FutureOr<void> cartRemoveFromCart(
    CartRemoveFromCart event,
    Emitter<CartState> emit,
  ) {
    cartItems.remove(event.itemToBeRemoved);
    emit(CartRemovedActionState());
    emit(CartSuccessState(cartItems: cartItems));
    // emit(CartInitial());
  }
}
