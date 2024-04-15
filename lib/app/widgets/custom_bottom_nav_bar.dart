import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 6.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(icon: const Icon(Icons.home), onPressed: () => onItemSelected(0)),
          IconButton(icon: const Icon(Icons.search), onPressed: () => onItemSelected(1)),
          const SizedBox(width: 40),  // The empty space in the middle
          IconButton(icon: const Icon(Icons.message), onPressed: () => onItemSelected(3)),
          IconButton(icon: const Icon(Icons.account_circle), onPressed: () => onItemSelected(4)),
        ],
      ),
    );
  }
}
