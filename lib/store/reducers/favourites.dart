import 'dart:developer';

import 'package:papakado/classes/product.dart';
import 'package:papakado/store/actions/favourites.dart';

List<Product> favouritesReducer(List<Product> items, dynamic action) {
    if ( action is UpdateFavouritesAction ) {
        return updateFavourites(items, action);
    }
    else if ( action is AddProductToFavouritesAction ) {
        return addProductToFavourites(items, action);
    } else if ( action is RemoveProductFromFavouritesAction ) {
        return removeProductFromFavourites(items, action);
    }
    
    return items;
}

List<Product> updateFavourites(
    List<Product> items, 
    UpdateFavouritesAction action
    ) {
    return List.from(action.products);
}


List<Product> addProductToFavourites(
    List<Product> items, 
    AddProductToFavouritesAction action
    ) {
    return [ ...List.from(items), action.product ];
}

List<Product> removeProductFromFavourites(
    List<Product> items, 
    RemoveProductFromFavouritesAction action
    ) {
    List<Product> newitems = List.from(items);
    newitems.removeWhere((item) => item.id == action.product.id);
    
    return newitems;
}