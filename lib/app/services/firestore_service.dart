import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/category.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveCategory(Category category) {
    return _db.collection('categories').doc(category.id).set(category.toFirestore());
  }

  Stream<List<Category>> getCategories() {
    return _db.collection('categories').snapshots().map((snapshot) =>
      snapshot.docs.map((doc) => Category.fromFirestore(doc)).toList());
  }
}
