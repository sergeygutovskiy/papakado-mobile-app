import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:papakado/classes/product.dart';
import 'package:papakado/layout/components/products/card.dart';
import 'package:papakado/store/state.dart';

class FavouritesScreen extends StatelessWidget {
    const FavouritesScreen({ Key? key }) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Container(
            color: Colors.grey[100],
            child: StoreConnector<StoreState, List<Product>>(
                converter: (store) => store.state.favourites,
                builder: (context, products) => ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemBuilder: (context, index) => ProductCard(product: products[index]), 
                    separatorBuilder: (context, index) => const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8) 
                    ), 
                    itemCount: products.length,
                ),
            ),
        );
    }
}