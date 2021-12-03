import 'package:papakado/classes/product.dart';

class UpdateFavouritesAction {
    final List<Product> products;
    UpdateFavouritesAction(this.products);
}

class AddProductToFavouritesAction {
    final Product product;
    AddProductToFavouritesAction(this.product);
}

class RemoveProductFromFavouritesAction {
    final Product product;
    RemoveProductFromFavouritesAction(this.product);
}