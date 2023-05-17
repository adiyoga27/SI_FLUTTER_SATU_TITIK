class ProductModel {
  ProductModel({
    required this.id,
    required this.categoryId,
    required this.categoryName,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.discount,
  });

  final int? id;
  final int? categoryId;
  final String? categoryName;
  final String? name;
  final String? description;
  final String? image;
  final int? price;
  final int? discount;

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"],
      categoryId: json["category_id"],
      categoryName: json["category_name"],
      name: json["name"],
      description: json["description"],
      image: json["image"],
      price: json["price"],
      discount: json["discount"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "category_name": categoryName,
        "name": name,
        "description": description,
        "image": image,
        "price": price,
        "discount": discount,
      };
}
