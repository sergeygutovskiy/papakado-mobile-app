import 'package:papakado/classes/product.dart';

class CartItem {
    final Product product;
    int quantity;

    CartItem({ required this.product, this.quantity = 0 });
}