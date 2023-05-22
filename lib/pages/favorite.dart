import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  static List<String> favoriteList = []; // List to store favorite data

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Favorite Characters'),
      ),
      body: ListView.builder(
        itemCount: favoriteList.length,
        itemBuilder: (context, index) {
          final idCharacter = favoriteList[index];
          return Card(
            child: ListTile(
              title: Text('$idCharacter'),
            ),
          );
        },
      ),
    );
  }
}
