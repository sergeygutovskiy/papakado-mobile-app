import 'dart:convert';
import 'dart:developer';

import 'package:papakado/classes/product.dart';
import 'package:papakado/store/actions/favourites.dart';
import 'package:papakado/store/state.dart';
import 'package:redux/redux.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

Future<void> saveFavourites(Store<StoreState> store) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    
    await prefs.setStringList(
        'favourites', 
        store.state.favourites.map((p) => p.id.toString()).toList()
    );
}

Future<void> loadFavourites(Store<StoreState> store) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> favouriteIds = prefs.getStringList('favourites') ?? []; 
    List<Product> favouriteProducts = [];

    var response = await http.get( Uri.parse('https://papakado.ru/api/client/products') );
    var data = jsonDecode(response.body)['data'];

    for (var productData in data) {
        if ( favouriteIds.contains(productData['id'].toString()) ) {
            favouriteProducts.add( Product.fromJson(productData) );
        }
    }

    store.dispatch(UpdateFavouritesAction(favouriteProducts));
}

void addProductToFavouritesSync(Store<StoreState> store, Product product) async {
    store.dispatch(AddProductToFavouritesAction(product));
    await saveFavourites(store);
}

void removeProductFromFavouritesSync(Store<StoreState> store, Product product) async {
    store.dispatch(RemoveProductFromFavouritesAction(product));
    await saveFavourites(store);
}