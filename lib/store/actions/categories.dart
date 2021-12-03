import 'package:papakado/classes/category.dart';
import 'package:papakado/layout/screens/category/filtering.dart';

class UpdateCategoriesAction {
    final List<Category> categories;
    UpdateCategoriesAction(this.categories);
}

class SortCategoryProductsAction {
    final int categoryId;    
    final FilteringEnum filter;

    SortCategoryProductsAction(this.categoryId, this.filter);
}