import 'package:papakado/classes/category.dart';
import 'package:papakado/layout/screens/category/filtering.dart';
import 'package:papakado/store/actions/categories.dart';

List<Category> categoriesReducer(List<Category> categories, dynamic action) {
    if ( action is UpdateCategoriesAction ) { return updateCategories(categories, action); }
    else if ( action is SortCategoryProductsAction ) { return sortCategoryProducts(categories, action); }
    
    return categories;
}

List<Category> updateCategories(List<Category> categories, UpdateCategoriesAction action) {
    return List.from(action.categories);
}

List<Category> sortCategoryProducts(List<Category> categories, SortCategoryProductsAction action) {
    var products = categories.firstWhere((c) => c.id == action.categoryId).products;

    switch (action.filter) {
        case FilteringEnum.priceMinToMax:
            products.sort((p1, p2) => p1.realPrice.value - p2.realPrice.value);
            break;
        case FilteringEnum.priceMaxToMin:
            products.sort((p1, p2) => p2.realPrice.value - p1.realPrice.value);
            break;
        case FilteringEnum.discountFirst:
            products.sort((p1, p2) {
                if (p1.haveDiscount && p2.haveDiscount) { return p1.realPrice.value - p2.realPrice.value; }
                else if (p1.haveDiscount && !p2.haveDiscount) { return -1; }
                else if (!p1.haveDiscount && p2.haveDiscount) { return 1; }
                return 0;
            });
            break;
        case FilteringEnum.discountLast:
            products.sort((p1, p2) {
                if (p1.haveDiscount && p2.haveDiscount) { return p2.realPrice.value - p1.realPrice.value; }
                else if (p1.haveDiscount && !p2.haveDiscount) { return 1; }
                else if (!p1.haveDiscount && p2.haveDiscount) { return -1; }
                return 0;
            });
            break;
    }

    return categories.map((c) {
        if (c.id == action.categoryId) c.products = products;
        return c;
    }).toList();
}