class Category {
  final String id;
  final String name;
  final List<String> subCategories;

  Category({required this.id, required this.name, required this.subCategories});

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'],
      name: map['name'],
      subCategories: List<String>.from(map['subCategories']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'subCategories': subCategories,
    };
  }
}