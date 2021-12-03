import 'package:flutter/material.dart';
import 'package:papakado/classes/category.dart';
import 'package:papakado/layout/screens/category/category.dart';

class CategoryCard extends StatelessWidget {
    const CategoryCard({ Key? key, required this.category}) : super(key: key);

    final Category category;

    @override
    Widget build(BuildContext context) {
        return GestureDetector(
            child: Container(
                padding: const EdgeInsets.all(24),
                color: Colors.white,
                child: Text(
                    category.name,
                    style: Theme.of(context).textTheme.headline2,
                ),
            ),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(
                    builder: (context) => CategoryScreen(category: category)
                )
            ),
        );
    }
}