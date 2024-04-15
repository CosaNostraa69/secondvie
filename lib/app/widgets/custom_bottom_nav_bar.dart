import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const CustomBottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 6.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(icon: Icon(Icons.home), onPressed: () => onItemSelected(0)),
          IconButton(icon: Icon(Icons.search), onPressed: () => onItemSelected(1)),
          SizedBox(width: 40),  // The empty space in the middle
          IconButton(icon: Icon(Icons.message), onPressed: () => onItemSelected(3)),
          IconButton(icon: Icon(Icons.account_circle), onPressed: () => onItemSelected(4)),
        ],
      ),
    );
  }
}
