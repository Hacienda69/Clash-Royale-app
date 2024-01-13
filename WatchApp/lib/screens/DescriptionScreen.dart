import 'package:WatchApp/screens/mainmenu.dart';
import 'package:flutter/material.dart';

class DescriptionScreen extends StatelessWidget {
  final String title;
  final String image;
  final String rating;

  DescriptionScreen({
    required this.title,
    required this.image,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(image),
            SizedBox(height: 20),
            Text(
              'Title: $title',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Rating: $rating',
              style: TextStyle(fontSize: 16),
            ),
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}
