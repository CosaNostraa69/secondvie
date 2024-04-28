import 'package:flutter/material.dart';
import '../models/category.dart';
import 'product_screen.dart';

class CategoryScreen extends StatelessWidget {
  final Category category;

  CategoryScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(category.name)),
      body: ListView.builder(
        itemCount: category.subCategories.length,
        itemBuilder: (context, index) {
          final subCategory = category.subCategories[index];
          return ListTile(
            title: Text(subCategory),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductScreen(categoryId: category.id, subCategory: subCategory)),
              );
            },
          );
        },
      ),
    );
  }
}