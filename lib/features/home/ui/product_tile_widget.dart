import 'package:flutter/material.dart';
import 'package:grocery_app/features/home/bloc/home_bloc.dart';
import 'package:grocery_app/features/home/models/data_model.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final HomeBloc homeBloc;
  const ProductTileWidget({
    super.key,
    required this.productDataModel,
    required this.homeBloc,
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
                      homeBloc.add(
                        HomeProductWishlistButtonClickedEvent(
                          clickedProduct: productDataModel,
                        ),
                      );
                    },
                    icon: Icon(Icons.favorite_border_outlined),
                  ),
                  Tooltip(
                    message: 'Add to cart',
                    child: IconButton(
                      onPressed: () {
                        homeBloc.add(
                          HomeProductCartButtonClickedEvent(
                            clickedProduct: productDataModel,
                          ),
                        );
                      },
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
