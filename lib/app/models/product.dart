class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final String category;
  final String subCategory;
  final String userId;
  final String brand;
  final String state;
  final List<String> images;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.subCategory,
    required this.userId,
    required this.brand,
    required this.state,
    required this.images, required String name,
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
      brand: map['brand'],
      state: map['state'],
      images: List<String>.from(map['images']), name: '',
    );
  }

  get name => null;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'category': category,
      'subCategory': subCategory,
      'userId': userId,
      'brand': brand,
      'state': state,
      'images': images,
    };
  }
}