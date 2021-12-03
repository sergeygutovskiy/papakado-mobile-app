class BannerImage {
    final String imagePath;

    BannerImage({ required this.imagePath });

    factory BannerImage.fromJson(Map<String, dynamic> data) => BannerImage(
        imagePath: 'https://papakado.ru' + data['image_path'],
    );
}