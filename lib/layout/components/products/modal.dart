import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:papakado/classes/product.dart';
import 'package:papakado/store/actions/cart.dart';
import 'package:papakado/store/actions/favourites.dart';
import 'package:papakado/store/reducers/favourites.dart';
import 'package:papakado/store/state.dart';
import 'package:papakado/store/thunk-actions/favourites.dart';
import 'package:redux/redux.dart';

class ProductModal extends StatelessWidget {
    const ProductModal({ Key? key, required this.product }) : super(key: key);

    final Product product;

    @override
    Widget build(BuildContext context) {
        return Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                    AspectRatio(
                        aspectRatio: 3 / 2,
                        child: Stack(
                            fit: StackFit.expand,
                            children: [
                                Image.network(
                                    product.imagePath,
                                    fit: BoxFit.cover,
                                ),
                                Positioned(
                                    top: 48,
                                    right: 16,
                                    child: StoreConnector<StoreState, Store<StoreState>>(
                                        converter: (store) => store,
                                        builder: (context, store) => GestureDetector(
                                            onTap: store.state.isProductInFavourites(product) 
                                            ?
                                            () => store.dispatch(
                                                (store) => removeProductFromFavouritesSync(store, product)
                                            )
                                            : 
                                            () => store.dispatch(
                                                (store) => addProductToFavouritesSync(store, product)
                                            )
                                            ,
                                            child: store.state.isProductInFavourites(product) ?
                                                Icon(
                                                    Icons.favorite,
                                                    size: 32,
                                                    color: Theme.of(context).primaryColorDark,
                                                )
                                                :
                                                const Icon(
                                                    Icons.favorite_border,
                                                    size: 32,
                                                    color: Colors.white,
                                                ),
                                        )
                                    )
                                ),
                                Positioned(
                                    left: 16,
                                    top: 48,
                                    child: GestureDetector(
                                        onTap: () => Navigator.pop(context),
                                        child: const Icon(
                                            Icons.arrow_back_outlined,
                                            color: Colors.white,
                                            size: 32,
                                        ),
                                    ),
                                ),
                            ],
                        )
                    ),
                    Container(
                        padding: const EdgeInsets.all(16),
                        color: Colors.white,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                        Expanded(
                                            flex: 8,
                                            child: Text(
                                                product.name,
                                                style: Theme.of(context).textTheme.headline2,
                                            ), 
                                        ),
                                        Expanded(
                                            flex: 2,
                                            child: Text(
                                                product.weight,
                                                style: TextStyle(
                                                    color: Colors.grey[500],
                                                ),
                                                textAlign: TextAlign.right,
                                            )
                                        ),
                                    ],
                                ),
                                
                                const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
                                Text(
                                    product.realPrice.formatted,
                                    style: const TextStyle(
                                        fontSize: 20,
                                    ),
                                ),
                                const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
                                    Text(
                                    product.description,
                                ),
                                const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
                                StoreConnector<StoreState, Store<StoreState>>(
                                    converter: (store) => store,
                                    builder: (BuildContext context, store) => CupertinoButton(
                                        onPressed: store.state.isProductInCart(product) ? null : () => store.dispatch(AddCartItemAction(product)),
                                        color: const Color(0xFFFF614E),
                                        disabledColor: const Color(0xFFFFA095),
                                        padding: const EdgeInsets.symmetric(vertical: 20),
                                        child: store.state.isProductInCart(product) ? Text(
                                            'Добавлено'.toUpperCase()
                                        ) : Text(
                                            'Добавить в корзину'.toUpperCase(),
                                        ),
                                    )
                                ),
                            ],
                        ),
                    ),  
                ],
            ),
        );
    }
}