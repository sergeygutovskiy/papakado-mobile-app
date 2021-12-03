import 'package:flutter/material.dart';
import 'package:papakado/classes/product.dart';
import 'package:papakado/layout/components/products/card.dart';

class ProductsList extends StatelessWidget {
    const ProductsList({ Key? key, required this.products }) : super(key: key);

    final List<Product> products;

    @override
    Widget build(BuildContext context) {
        return ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 16,
            ),
            itemBuilder: (BuildContext context, int index) => ProductCard(product: products[index]), 
            separatorBuilder: (BuildContext contex, int index) => const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
            ),
            itemCount: products.length, 
        );
    }
}