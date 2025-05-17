import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grocery_app/data/wishlist_items.dart';
import 'package:grocery_app/features/home/models/data_model.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<WishlistRemoveFromWishlist>(wishlistRemoveFromWishlist);
  }

  FutureOr<void> wishlistInitialEvent(
    WishlistInitialEvent event,
    Emitter<WishlistState> emit,
  ) {
    emit(WishlistSuccessState(wishlistItems: wishlistItems));
  }

  FutureOr<void> wishlistRemoveFromWishlist(
    WishlistRemoveFromWishlist event,
    Emitter<WishlistState> emit,
  ) {
    wishlistItems.remove(event.itemToBeRemoved);
    emit(WishlistRemovedActionState());
    emit(WishlistSuccessState(wishlistItems: wishlistItems));
  }
}
