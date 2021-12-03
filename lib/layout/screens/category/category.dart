import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:papakado/classes/category.dart';
import 'package:papakado/layout/screens/category/list.dart';
import 'package:papakado/store/state.dart';
import 'package:papakado/store/thunk-actions/categories.dart';

import 'filtering.dart';

class CategoryScreen extends StatefulWidget {
    const CategoryScreen({ Key? key, required this.category }) : super(key: key);

    final Category category;

    @override
    _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text(widget.category.name),
                backgroundColor: const Color(0xFFFF614E),
            ),
            body: Container(
                color: Colors.grey[100],
                child: StoreConnector<StoreState, Category>(
                    onInit: (store) => store.dispatch((store) => getCategoryProducts(store, widget.category.id)),
                    converter: (store) => store.state.categories.firstWhere((c) => c.id == widget.category.id),
                    builder: (context, category) => Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                            Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 16
                                ),
                                padding: const EdgeInsets.all(24),
                                color: Colors.white,
                                child: FilterButton( id: widget.category.id ),
                            ),
                            Expanded(
                                child: ProductsList(products: category.products),
                            ),
                        ],
                    ),
                ),
            ),
        );
    }
}