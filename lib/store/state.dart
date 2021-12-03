import 'package:papakado/classes/banner_image.dart';
import 'package:papakado/classes/cart_item.dart';
import 'package:papakado/classes/category.dart';
import 'package:papakado/classes/product.dart';

class StoreState {
    final List<Category> _categories;
    final List<CartItem> _cart;
    final List<BannerImage> _banners;
    final List<Product> _favourites;

    // 

    List<Category> get categories => _categories;
    List<CartItem> get cart => _cart;
    List<BannerImage> get banners => _banners;
    List<Product> get favourites => _favourites;
    int get cartTotal => _cart.isNotEmpty ?
        _cart.map((i) => i.product.realPrice.value)
        .toList()
        .reduce((int total, int price) => total + price)
        :
        0
        ;

    // 

    StoreState(
        this._categories,
        this._cart,
        this._banners,
        this._favourites,
    );

    StoreState.initial() : 
        _categories = [], 
        _cart = [],
        _banners = [],
        _favourites = []
        ;

    // 

    bool isProductInCart(Product product) {
        return _cart.any((i) => i.product.id == product.id);
    }

    bool isProductInFavourites(Product product) {
        return _favourites.any((i) => i.id == product.id);
    }
}
