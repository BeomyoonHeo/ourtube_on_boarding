import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget with PreferredSizeWidget {
  final VoidCallback moveSearchScreen;
  SearchBar({
    Key? key,
    required this.moveSearchScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: InkWell(
              onTap: moveSearchScreen,
              borderRadius: BorderRadius.circular(30),
              child: const Icon(Icons.search, color: Color(0xFF4A4D57)),
            ),
          )
        ]);
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
