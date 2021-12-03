import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:papakado/classes/cart_item.dart';
import 'package:papakado/store/actions/cart.dart';
import 'package:papakado/store/state.dart';

import 'modal.dart';

class ProductCartCard extends StatelessWidget {
    const ProductCartCard({ Key? key, required this.cartItem }) : super(key: key);

    final CartItem cartItem;

    @override
    Widget build(BuildContext context) {
        return GestureDetector(
            onTap: () => showMaterialModalBottomSheet(
                context: context,
                builder: (context) => ProductModal(product: cartItem.product),
            ),
            child: Container(
                color: Colors.white,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                        Expanded(
                            flex: 35,
                            child: AspectRatio(
                                aspectRatio: 1 / 1,
                                child: Image.network(
                                    cartItem.product.imagePath,
                                    fit: BoxFit.cover,
                                ),
                            ),
                        ),
                        Expanded(
                            flex: 65,
                            child: Container(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                        Text(cartItem.product.name),
                                        const Padding(
                                            padding: EdgeInsets.symmetric(vertical: 8)
                                        ),
                                        Text(cartItem.product.realPrice.formatted),
                                    ],
                                ),
                            ), 
                        ),
                        StoreConnector<StoreState, VoidCallback>(
                            converter: (store) => () => store.dispatch(RemoveCartItemAction(cartItem.product)),
                            builder: (context, callback) => GestureDetector(
                                onTap: () => callback(),
                                child: Container(
                                    padding: const EdgeInsets.only(
                                        top: 8,
                                        right: 8,
                                    ),
                                    child: Icon(
                                        Icons.delete,
                                        color: Theme.of(context).primaryColorDark,
                                    ),
                                ),
                            ), 
                        ),
                    ],
                )
            ),
        );
    }
}