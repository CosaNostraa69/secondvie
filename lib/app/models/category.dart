import 'package:cloud_firestore/cloud_firestore.dart';

class Category {
  final String id;
  final String name;
  final List<String> subCategories;

  Category({required this.id, required this.name, required this.subCategories});

  factory Category.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return Category(
      id: doc.id,
      name: data['name'],
      subCategories: List<String>.from(data['subCategories']),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'subCategories': subCategories,
    };
  }
}
