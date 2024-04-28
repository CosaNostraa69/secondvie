class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final String category;
  final String subCategory;
  final String userId;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.subCategory,
    required this.userId,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      price: map['price'],
      category: map['category'],
      subCategory: map['subCategory'],
      userId: map['userId'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'category': category,
      'subCategory': subCategory,
      'userId': userId,
    };
  }
}