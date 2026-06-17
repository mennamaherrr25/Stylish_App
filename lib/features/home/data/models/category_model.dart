class CategoryModel {
  final String name;
  final String image;
  final String slug;
  CategoryModel({required this.name, required this.image, required this.slug});

  // بيانات العنصر الواحد مش الليست كلها
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      slug: json['slug'],
    );
  }
}
