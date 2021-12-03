import 'package:flutter/material.dart';
import 'package:papakado/classes/product.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:papakado/layout/components/products/modal.dart';

class ProductCard extends StatelessWidget {
    const ProductCard({ Key? key, required this.product}) : super(key: key);

    final Product product;

    @override
    Widget build(BuildContext context) {
        return GestureDetector(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                    AspectRatio(
                        aspectRatio: 3 / 2,
                        child: Image.network(
                            product.imagePath,
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, progress) => 
                                progress == null 
                                ? child : Container(
                                    color: Colors.grey[200],
                                ),
                        ),
                    ),
                    Container(
                        padding: const EdgeInsets.all(24),
                        color: Colors.white,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                        Expanded(
                                            flex: 8,
                                            child: Text(
                                                product.name,
                                                style: Theme.of(context).textTheme.headline2,
                                            ), 
                                        ),
                                        Expanded(
                                            flex: 2,
                                            child: Text(
                                                product.weight,
                                                style: TextStyle(
                                                    color: Colors.grey[500],
                                                ),
                                                textAlign: TextAlign.right,
                                            )
                                        ),
                                    ],
                                ),
                                const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
                                Text(
                                    product.realPrice.formatted,
                                    style: const TextStyle(
                                        fontSize: 20,
                                    ),
                                ),
                            ],
                        ),
                    ),  
                ],
            ),
            onTap: () => showMaterialModalBottomSheet(
                context: context,
                builder: (context) => ProductModal(product: product),
            ),
        );
    }
}