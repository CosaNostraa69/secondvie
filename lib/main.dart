import 'package:flutter/material.dart';
import 'package:new_app_secondmain/app/views/new_product_screen.dart';
import '/app/widgets/custom_bottom_nav_bar.dart';
import '/app/views/new_product_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SecondVie',
      theme: ThemeData(
        brightness: Brightness.dark, // Thème sombre global
        primaryColor: Colors.grey[900],
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.white, // Couleur du bouton FloatingActionButton
          foregroundColor: Colors.black, // Couleur de l'icône
        ),
        appBarTheme: AppBarTheme(
          color: Colors.black, // Couleur de la AppBar
          iconTheme: IconThemeData(color: Colors.white), // Couleur des icônes de la AppBar
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.black, // Couleur de fond de la BottomNavigationBar
          selectedItemColor: Colors.white, // Couleur de l'icône sélectionnée
          unselectedItemColor: Colors.grey[700], // Couleur des icônes non sélectionnées
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 2) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => NewItemScreen()));  // Affiche NewItemScreen
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _selectedIndex == 0 || _selectedIndex == 1
            ? _buildSearchBar()
            : const Text('SecondVie'),
      ),
      body: Center(
        child: Text('Content for Tab $_selectedIndex', style: const TextStyle(fontSize: 30)),
      ),
      floatingActionButton: _selectedIndex == 2
          ? null
          : FloatingActionButton(
              onPressed: () => _onItemTapped(2),
              child: const Icon(Icons.add),
              elevation: 2.0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)), // Forme arrondie
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemSelected: _onItemTapped,
      ),
    );
  }

  Widget _buildSearchBar() {
    return const TextField(
      decoration: InputDecoration(
        hintText: 'Rechercher...',
        prefixIcon: Icon(Icons.search),
        border: InputBorder.none,
      ),
    );
  }
}

