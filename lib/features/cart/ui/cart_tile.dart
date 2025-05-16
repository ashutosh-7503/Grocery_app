import 'package:flutter/material.dart';
import 'package:grocery_app/features/cart/bloc/cart_bloc.dart';
// import 'package:grocery_app/features/home/bloc/home_bloc.dart';
import 'package:grocery_app/features/home/models/data_model.dart';

class CartTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final CartBloc cartBloc;

  const CartTileWidget({
    super.key,
    required this.productDataModel,
    required this.cartBloc,
  });

  @override
  Widget build(BuildContext context) {
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
          Container(
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
                "\$ " + productDataModel.price.toString(),
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      // cartBloc.add(HomeProductWishlistButtonClickedEvent(
                      //   clickedProduct: productDataModel
                      // ));
                    },
                    icon: Icon(Icons.favorite_border_outlined),
                  ),
                  Tooltip(
                    message: 'Remove from cart',
                    child: IconButton(
                      onPressed: () {
                        cartBloc.add(
                          CartRemoveFromCart(itemToBeRemoved: productDataModel),
                        );
                      },
                      icon: Icon(Icons.shopping_bag),
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
