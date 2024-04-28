import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product.dart';

class ProductService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addProduct(Product product) async {
    try {
      await _firestore.collection('products').add({
  'name': product.name,
  'description': product.description,
  'price': product.price,
  'category': product.category,
  'brand': product.brand,
  'state': product.state,
  'images': product.images,
});
    } catch (e) {
      print('Error adding product: $e');
      rethrow;
    }
  }

  // Autres méthodes liées aux produits (getProducts, updateProduct, deleteProduct, etc.)
}