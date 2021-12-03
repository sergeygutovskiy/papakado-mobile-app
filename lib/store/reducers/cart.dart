import 'package:papakado/classes/cart_item.dart';
import 'package:papakado/store/actions/cart.dart';

List<CartItem> cartReducer(List<CartItem> items, dynamic action) {
    if (action is AddCartItemAction) { return addCartItem(items, action); }
    else if (action is RemoveCartItemAction) { return removeCartItem(items, action); }
    
    return items;
}

List<CartItem> addCartItem(List<CartItem> items, AddCartItemAction action) {
    var item = CartItem(
        product: action.product, 
    );

    return [...items, item];
}

List<CartItem> removeCartItem(List<CartItem> items, RemoveCartItemAction action) {
    List<CartItem> newitems = List.from(items);
    newitems.removeWhere((item) => item.product.id == action.product.id);
    
    return newitems;
}