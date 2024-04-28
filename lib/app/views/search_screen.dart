import 'package:flutter/material.dart';
import 'package:new_app_secondmain/app/views/add_product_screen.dart';
import 'package:new_app_secondmain/app/widgets/custom_bottom_nav_bar.dart';
import '../models/category.dart';

class SearchScreen extends StatefulWidget {
  final List<Category> categories;

  SearchScreen({required this.categories, required Category category});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pop(context); // Revient à la page précédente (MyHomePage)
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => AddProductScreen())); // Navigue vers NewItemScreen
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: ListView.builder(
        itemCount: widget.categories.length,
        itemBuilder: (context, index) {
          var category = widget.categories[index];
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