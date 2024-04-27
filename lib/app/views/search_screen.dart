import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  final List<Category> categories;

  SearchScreen({required this.categories});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rechercher par catégorie'),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          var category = categories[index];
          return ExpansionTile(
            title: Text(category.name),
            children: category.subCategories.map((subCategory) {
              return ListTile(
                title: Text(subCategory),
                onTap: () {
                  // Implémenter la logique de recherche ou de filtrage ici
                  print("Recherche dans la sous-catégorie: $subCategory");
                },
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
