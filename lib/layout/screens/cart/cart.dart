import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:papakado/layout/screens/cart/cart_items_list.dart';
import 'package:papakado/store/state.dart';

class CartScreen extends StatelessWidget {
    const CartScreen({ Key? key }) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Container(
            color: Colors.grey[100],
            child: StoreConnector<StoreState, StoreState>(
                converter: (store) => store.state,
                builder: (context, state) => CartItemsList(
                    items: state.cart,
                    total: state.cartTotal,
                ), 
            )
        );
    }
}