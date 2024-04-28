import 'package:flutter/material.dart';
import '../services/firebase_service.dart';
import '../models/product.dart';

class AddProductScreen extends StatefulWidget {
  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _categoryController = TextEditingController();
  final _subCategoryController = TextEditingController();
  final FirebaseService _firebaseService = FirebaseService();

  void _addProduct() async {
    if (_formKey.currentState!.validate()) {
      final product = Product(
        id: '',
        title: _titleController.text,
        description: _descriptionController.text,
        price: double.parse(_priceController.text),
        category: _categoryController.text,
        subCategory: _subCategoryController.text,
        userId: '', // Remplacez par l'ID de l'utilisateur actuellement connecté
      );
      await _firebaseService.addProduct(product);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ajouter un produit')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Titre'),
              validator: (value) => value!.isEmpty ? 'Veuillez entrer un titre' : null,
            ),
            TextFormField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
              validator: (value) => value!.isEmpty ? 'Veuillez entrer une description' : null,
            ),
            TextFormField(
              controller: _priceController,
              decoration: InputDecoration(labelText: 'Prix'),
              keyboardType: TextInputType.number,
              validator: (value) => value!.isEmpty ? 'Veuillez entrer un prix' : null,
            ),
            TextFormField(
              controller: _categoryController,
              decoration: InputDecoration(labelText: 'Catégorie'),
              validator: (value) => value!.isEmpty ? 'Veuillez entrer une catégorie' : null,
            ),
            TextFormField(
              controller: _subCategoryController,
              decoration: InputDecoration(labelText: 'Sous-catégorie'),
              validator: (value) => value!.isEmpty ? 'Veuillez entrer une sous-catégorie' : null,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _addProduct,
              child: Text('Ajouter'),
            ),
          ],
        ),
      ),
    );
  }
}