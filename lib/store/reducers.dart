import 'package:papakado/store/reducers/banners.dart';
import 'package:papakado/store/reducers/cart.dart';
import 'package:papakado/store/reducers/categories.dart';
import 'package:papakado/store/reducers/favourites.dart';
import 'state.dart';

StoreState storeReducers(StoreState state, dynamic action) {
    return StoreState(
        categoriesReducer(state.categories, action),
        cartReducer(state.cart, action),
        bannersReducer(state.banners, action),
        favouritesReducer(state.favourites, action),
    );
}