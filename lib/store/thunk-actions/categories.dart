import 'dart:convert';

import 'package:redux/redux.dart';
import 'package:http/http.dart' as http;

import 'package:papakado/classes/category.dart';
import 'package:papakado/classes/product.dart';
import 'package:papakado/store/actions/categories.dart';
import 'package:papakado/store/state.dart';

void getCategories(Store<StoreState> store) async {
    List<Category> categories = [];

    var response = await http.get( Uri.parse('https://papakado.ru/api/client/categories') );
    var data = jsonDecode(response.body)['data'];

    for (var categoryData in data) {
        categories.add( Category.fromJson(categoryData) );
    }

    store.dispatch( UpdateCategoriesAction(categories) );
}

void getCategoryProducts(Store<StoreState> store, int categoryId) async {
    List<Product> products = [];

    var response = await http.get( Uri.parse('https://papakado.ru/api/client/categories/$categoryId/products') );
    var data = jsonDecode(response.body)['data'];

    for (var productData in data) {
        products.add( Product.fromJson(productData) );
    }

    store.dispatch(UpdateCategoriesAction(
        store.state.categories.map((c) {
            if (c.id == categoryId) c.products = products;
            return c;
        }).toList()
    ));
}