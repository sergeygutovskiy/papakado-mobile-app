import 'dart:convert';

import 'package:papakado/classes/banner_image.dart';
import 'package:papakado/store/actions/banners.dart';
import 'package:redux/redux.dart';
import 'package:http/http.dart' as http;

import 'package:papakado/store/state.dart';

void getBanners(Store<StoreState> store) async {
    List<BannerImage> banners = [];

    var response = await http.get( Uri.parse('https://papakado.ru/api/client/banners') );
    var data = jsonDecode(response.body)['data'];

    for (var bannerData in data) {
        banners.add( BannerImage.fromJson(bannerData) );
    }

    store.dispatch( UpdateBannersAction(banners) );
}