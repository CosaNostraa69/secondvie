import 'package:flutter/material.dart';

class NewItemScreen extends StatelessWidget {
  const NewItemScreen({super.key});

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
            onTap: () {
              // TODO: Ajouter la logique pour charger des images
            },
            child: Container(
              height: 150,
              color: Colors.grey[200],
              child: Icon(
                Icons.camera_alt,
                color: Colors.grey[600],
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
            onChanged: (value) {
              // TODO: stocker la valeur sélectionnée
            },
            decoration: const InputDecoration(labelText: 'Catégorie'),
          ),
          DropdownButtonFormField<String>(
            items: ['T-Shirt', 'Pantalon', 'Pull']
                .map((label) => DropdownMenuItem(
                      value: label,
                      child: Text(label),
                    ))
                .toList(),
            onChanged: (value) {
              // TODO: stocker la valeur sélectionnée
            },
            decoration: const InputDecoration(labelText: 'État'),
          ),
          DropdownButtonFormField<String>(
            items: ['Neuf avec étiquettes', 'Bon état', 'Abimé']
                .map((label) => DropdownMenuItem(
                      value: label,
                      child: Text(label),
                    ))
                .toList(),
            onChanged: (value) {
              // TODO: stocker la valeur sélectionnée
            },
            decoration: const InputDecoration(labelText: 'Marque'),
          ),
          // ... Ajouter d'autres champs ici ...
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
