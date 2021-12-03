import 'package:papakado/layout/screens/favourites/favourites.dart';
import 'package:papakado/theme.dart';
import 'package:redux/redux.dart';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:papakado/layout/screens/cart/cart.dart';
import 'package:papakado/layout/screens/categories/categories.dart';
import 'package:papakado/layout/screens/home/home.dart';
import 'package:papakado/store/state.dart';

class App extends StatelessWidget {
    const App({ Key? key, required this.store }) : super(key: key);

    final Store<StoreState> store;

    @override
    Widget build(BuildContext context) {
        return StoreProvider(
            store: store, 
            child: MaterialApp(
                theme: appTheme(),
                initialRoute: '',
                routes: {
                    '/': (context) => const AppScreen(),
                },
            ),
        );
    }
}

class AppScreen extends StatelessWidget {
    const AppScreen({ Key? key }) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return DefaultTabController(
            length: 4,
            child: Scaffold(
                appBar: AppBar(
                    backgroundColor: Theme.of(context).primaryColor,
                    title: Text(
                        'Papakado', 
                        style: Theme.of(context).textTheme.headline1,
                    ),
                    bottom: const TabBar(
                        tabs: [
                            Tab( icon: Icon(Icons.home) ),
                            Tab( icon: Icon(Icons.auto_stories) ),
                            Tab( icon: Icon(Icons.shopping_bag) ),
                            Tab( icon: Icon(Icons.favorite) ),
                        ] 
                    ),
                ),
                body: const TabBarView(
                    children: [
                        HomeScreen(),
                        CategoriesScreen(),
                        CartScreen(),
                        FavouritesScreen(),
                    ]
                ),
            )
        );
    }
}