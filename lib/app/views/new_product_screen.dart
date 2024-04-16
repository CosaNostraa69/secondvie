import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class NewItemScreen extends StatefulWidget {
  const NewItemScreen({super.key});

  @override
  _NewItemScreenState createState() => _NewItemScreenState();
}

class _NewItemScreenState extends State<NewItemScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Poster une annonce'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          GestureDetector(
            onTap: _pickImage,
            child: Container(
              height: 150,
              color: Colors.grey[200],
              child: _images!.isEmpty
                  ? const Icon(
                      Icons.camera_alt,
                      color: Colors.grey,
                    )
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _images!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.file(File(_images![index].path)),
                        );
                      },
                    ),
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Titre'),
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Description'),
          ),
          DropdownButtonFormField<String>(
            items: ['Marque 1', 'Marque 2', 'Marque 3']
                .map((label) => DropdownMenuItem(
                      value: label,
                      child: Text(label),
                    ))
                .toList(),
            onChanged: (value) {},
            decoration: const InputDecoration(labelText: 'Marque'),
          ),
          DropdownButtonFormField<String>(
            items: ['T-Shirt', 'Pantalon', 'Pull']
                .map((label) => DropdownMenuItem(
                      value: label,
                      child: Text(label),
                    ))
                .toList(),
            onChanged: (value) {},
            decoration: const InputDecoration(labelText: 'Catégorie'),
          ),
          DropdownButtonFormField<String>(
            items: ['Neuf avec étiquettes', 'Bon état', 'Abimé']
                .map((label) => DropdownMenuItem(
                      value: label,
                      child: Text(label),
                    ))
                .toList(),
            onChanged: (value) {},
            decoration: const InputDecoration(labelText: 'État'),
          ),
          ElevatedButton(
            child: const Text('Publier'),
            onPressed: () {
              // TODO: Implémenter la logique de publication
            },
          ),
        ],
      ),
    );
  }
}
