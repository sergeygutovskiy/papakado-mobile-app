import 'package:papakado/classes/product.dart';

class AddCartItemAction {
    final Product product;
    AddCartItemAction(this.product);
}

class RemoveCartItemAction {
    final Product product;
    RemoveCartItemAction(this.product);
}