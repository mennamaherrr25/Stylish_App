class ProductsModel {
  final String image;
  final String title;
  final String description;
  final double price;
  ProductsModel({
    required this.image,
    required this.title,
    required this.description,
    required this.price,
  });

  factory ProductsModel.fromjson(Map<String, dynamic> jsonData) {
    return ProductsModel(
      image: jsonData['category']['image'],
      title: jsonData['title'],
      description: jsonData['description'],
      price: (jsonData['price'] as num).toDouble(),
    );
  }
}
