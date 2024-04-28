import 'package:flutter/material.dart';
import '../services/firebase_service.dart';
import '../models/product.dart';

class ProductScreen extends StatelessWidget {
  final String categoryId;
  final String subCategory;
  final FirebaseService _firebaseService = FirebaseService();

  ProductScreen({required this.categoryId, required this.subCategory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(subCategory)),
      body: FutureBuilder<List<Product>>(
        future: _firebaseService.getProductsByCategory(categoryId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final products = snapshot.data!;
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                if (product.subCategory == subCategory) {
                  return ListTile(
                    title: Text(product.title),
                    subtitle: Text(product.price.toString()),
                  );
                } else {
                  return SizedBox.shrink();
                }
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}