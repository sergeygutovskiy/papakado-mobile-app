import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:papakado/classes/category.dart';
import 'package:papakado/layout/components/categories/card.dart';
import 'package:papakado/store/state.dart';
import 'package:papakado/store/thunk-actions/categories.dart';

class CategoriesScreen extends StatefulWidget {
    const CategoriesScreen({ Key? key }) : super(key: key);

    @override
    _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
    @override
    Widget build(BuildContext context) {
        return Container(
            color: Colors.grey[100],
            child: StoreConnector<StoreState, List<Category>>(
                onInit: (store) => store.dispatch(getCategories),
                converter: (store) => store.state.categories,
                builder: (context, categories) => CategoriesList(categories: categories),
            ),
        );
    }
}

// 

class CategoriesList extends StatelessWidget {
    const CategoriesList({ Key? key, required this.categories }) : super(key: key);

    final List<Category> categories;

    @override
    Widget build(BuildContext context) {
        return ListView.separated(
            padding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 16,
            ),
            itemBuilder: (BuildContext context, int index) => CategoryCard(
                category: categories[index],
            ), 
            separatorBuilder: (BuildContext contex, int index) => const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
            ),
            itemCount: categories.length, 
        );
    }
}