import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:papakado/classes/banner_image.dart';
import 'package:papakado/store/state.dart';
import 'package:papakado/store/thunk-actions/banners.dart';
import 'package:papakado/store/thunk-actions/favourites.dart';

class HomeScreen extends StatelessWidget {
    const HomeScreen({ Key? key }) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return StoreConnector<StoreState, List<BannerImage>>(
            onInit: (store) {
                store.dispatch(getBanners);
                store.dispatch(loadFavourites);
            },
            converter: (store) => store.state.banners,
            builder: (context, banners) => Container(
                color: Colors.grey[100],
                child: ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemBuilder: (context, index) => AspectRatio(
                        aspectRatio: 380 / 250,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                                banners[index].imagePath,
                                fit: BoxFit.cover,
                                loadingBuilder: (context, child, progress) => 
                                    progress == null 
                                    ? child : Container(
                                        color: Colors.white,
                                    ),
                            ),
                        ),
                    ), 
                    separatorBuilder: (context, index) => const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                    ), 
                    itemCount: banners.length,
                ),
            ),
        );
    }
}