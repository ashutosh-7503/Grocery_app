// import 'dart:nativewrappers/_internal/vm/lib/math_patch.dart';

import 'package:flutter/material.dart';
// import 'package:grocery_app/features/wishlist/bloc/wishlist_bloc.dart';
// import 'package:grocery_app/features/home/bloc/home_bloc.dart';
import 'package:grocery_app/features/home/models/data_model.dart';
import 'package:grocery_app/features/wishlist/bloc/wishlist_bloc.dart';

class WishlistTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final WishlistBloc wishlistBloc;

  const WishlistTileWidget({
    super.key,
    required this.productDataModel,
    required this.wishlistBloc,
  });
  @override
  Widget build(BuildContext context) {
    // log(45);
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black45),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 200,
            width: double.maxFinite,
            child: Image.network(productDataModel.imageUrl, fit: BoxFit.cover),
          ),
          const SizedBox(height: 20),
          Text(
            productDataModel.name,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          Text(productDataModel.description),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$ ${productDataModel.price}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      wishlistBloc.add(
                        WishlistRemoveFromWishlist(
                          itemToBeRemoved: productDataModel,
                        ),
                      );
                    },
                    icon: Icon(Icons.favorite),
                  ),
                  Tooltip(
                    message: 'Remove from wishlist',
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.shopping_bag_outlined),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
