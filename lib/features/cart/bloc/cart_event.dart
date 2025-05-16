part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class CartInitialEvent extends CartEvent {}

class CartRemoveFromCart extends CartEvent {
  final ProductDataModel itemToBeRemoved;

  CartRemoveFromCart({required this.itemToBeRemoved});
}
