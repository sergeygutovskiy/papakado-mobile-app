import 'package:flutter/material.dart';
import 'package:papakado/classes/cart_item.dart';
import 'package:papakado/classes/currency.dart';
import 'package:papakado/layout/components/products/cart_card.dart';

class CartItemsList extends StatelessWidget {
    const CartItemsList({ Key? key, required this.items, required this.total }) : super(key: key);

    final List<CartItem> items;
    final int total;

    @override
    Widget build(BuildContext context) {
        return ListView.separated(
            padding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 16,
            ),
            itemBuilder: (context, index) => index < items.length ? 
                ProductCartCard(cartItem: items[index])
                :
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        const Text('Итог:'),
                        Text(
                            Currency(total).formatted,
                            style: Theme.of(context).textTheme.headline2,
                        ),
                    ],
                ), 
            separatorBuilder: (context, index) => const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
            ), 
            itemCount: items.length + 1,
        );
    }
}