import 'currency.dart';

class Product {
    final int id;
    final String name;

    Currency price;
    Currency? discountPrice;

    final String imagePath;
    final String description;
    final String weight;

    Product(
        this.id,
        this.name,
        int price,
        int? discountPrice,
        this.imagePath,
        this.description,
        this.weight,
    ) 
        : price = Currency(price),
        discountPrice = discountPrice != null ? Currency(discountPrice) : null;

    factory Product.fromJson(Map<String, dynamic> json) {
        return Product(
            json['id'],
            json['name'],
            json['price'],
            json['price_discount'],
            'https://papakado.ru' + json['image_path'],
            json['description'],
            json['weight'],
        );
    }

    Currency get realPrice => discountPrice ?? price;
    bool get haveDiscount => discountPrice != null;
}