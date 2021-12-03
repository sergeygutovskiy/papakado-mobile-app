import 'package:papakado/classes/banner_image.dart';
import 'package:papakado/store/actions/banners.dart';

List<BannerImage> bannersReducer(List<BannerImage> items, dynamic action) {
    if ( action is UpdateBannersAction ) { return updateBanners(items, action); }
    
    return items;
}

List<BannerImage> updateBanners(List<BannerImage> banners, UpdateBannersAction action) {
    return List.from(action.banners);
}