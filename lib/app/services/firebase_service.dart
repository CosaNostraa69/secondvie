import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/category.dart';
import '../models/product.dart';
import '../models/app_user.dart';

class FirebaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Catégories
  Future<List<Category>> getCategories() async {
    final snapshot = await _db.collection('categories').get();
    return snapshot.docs.map((doc) => Category.fromMap(doc.data())).toList();
  }

  // Produits
  Future<void> addProduct(Product product) async {
    await _db.collection('products').add(product.toMap());
  }

  Future<List<Product>> getProductsByCategory(String categoryId) async {
    final snapshot = await _db.collection('products').where('category', isEqualTo: categoryId).get();
    return snapshot.docs.map((doc) => Product.fromMap(doc.data())).toList();
  }

  // Utilisateurs
  Future<void> signUp(String email, String password, String name) async {
    final userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    final appUser = AppUser(id: userCredential.user!.uid, email: email, name: name);
    await _db.collection('users').doc(appUser.id).set(appUser.toMap());
  }

  Future<AppUser?> signIn(String email, String password) async {
    final userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
    final snapshot = await _db.collection('users').doc(userCredential.user!.uid).get();
    if (snapshot.exists) {
      return AppUser.fromMap(snapshot.data()!);
    }
    return null;
  }
}