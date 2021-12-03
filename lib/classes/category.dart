import 'product.dart';

class Category {
    final int id;
    final String name;
    final String slug;

    List<Product> products = [];

    Category({
        required this.id,
        required this.name,
        required this.slug,
    });

    factory Category.fromJson(Map<String, dynamic> json) {
        return Category(
            id: json['id'],
            name: json['name'],
            slug: json['slug'],
        );
    }
}
