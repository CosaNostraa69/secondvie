import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../models/product.dart';
import '../services/product_service.dart';

class AddProductScreen extends StatefulWidget {
  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _categoryController = TextEditingController();
  final _brandController = TextEditingController();
  final _stateController = TextEditingController();

  final ProductService _productService = ProductService();
  final ImagePicker _picker = ImagePicker();
  List<XFile>? _images = [];

  Future<void> _pickImage() async {
    final List<XFile>? selectedImages = await _picker.pickMultiImage();
    if (selectedImages != null && selectedImages.isNotEmpty) {
      setState(() {
        _images = selectedImages;
      });
    }
  }

  void _addProduct() {
    if (_formKey.currentState!.validate()) {
      final product = Product(
  id: '',
  name: _nameController.text,
  description: _descriptionController.text,
  price: double.parse(_priceController.text),
  category: _categoryController.text,
  brand: _brandController.text,
  state: _stateController.text,
  images: _images!.map((image) => image.path).toList(), title: '', subCategory: '', userId: '',
);

      _productService.addProduct(product);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Poster une annonce'),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  height: 150,
                  color: Colors.grey[200],
                  child: _images!.isEmpty
                      ? Icon(Icons.camera_alt, color: Colors.grey)
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _images!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Image.file(File(_images![index].path)),
                            );
                          },
                        ),
                ),
              ),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Titre'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un titre';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer une description';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _priceController,
                decoration: InputDecoration(labelText: 'Prix'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un prix';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Veuillez entrer un prix valide';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                items: ['Marque 1', 'Marque 2', 'Marque 3']
                    .map((label) => DropdownMenuItem(
                          value: label,
                          child: Text(label),
                        ))
                    .toList(),
                onChanged: (value) {
                  _brandController.text = value!;
                },
                decoration: InputDecoration(labelText: 'Marque'),
              ),
              DropdownButtonFormField<String>(
                items: ['T-Shirt', 'Pantalon', 'Pull']
                    .map((label) => DropdownMenuItem(
                          value: label,
                          child: Text(label),
                        ))
                    .toList(),
                onChanged: (value) {
                  _categoryController.text = value!;
                },
                decoration: InputDecoration(labelText: 'Catégorie'),
              ),
              DropdownButtonFormField<String>(
                items: ['Neuf avec étiquettes', 'Bon état', 'Abimé']
                    .map((label) => DropdownMenuItem(
                          value: label,
                          child: Text(label),
                        ))
                    .toList(),
                onChanged: (value) {
                  _stateController.text = value!;
                },
                decoration: InputDecoration(labelText: 'État'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                child: Text('Publier'),
                onPressed: _addProduct,
              ),
            ],
          ),
        ),
      ),
    );
  }
}