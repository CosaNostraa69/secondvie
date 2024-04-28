import 'package:flutter/material.dart';
import '../services/firestore_service.dart';
import '../models/category.dart';

class CategoriesScreen extends StatelessWidget {
  final FirestoreService firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Category>>(
      stream: firestoreService.getCategories(),
      builder: (context, snapshot) {
        if (snapshot.hasError) return Text('Erreur: ${snapshot.error}');
        if (!snapshot.hasData) return CircularProgressIndicator();

        List<Category> categories = snapshot.data!;
        return ListView(
          children: categories.map((category) => ListTile(
            title: Text(category.name),
            subtitle: Text(category.subCategories.join(', ')),
          )).toList(),
        );
      },
    );
  }
}
