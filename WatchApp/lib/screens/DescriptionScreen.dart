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
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        shadowColor: Colors.black,
        elevation: 10,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(0, 0, 0, 0),
              ),
              child: const Icon(
                Icons.home_outlined,
                color: Colors.white,
                size: 30,
              ),
            ),
            const Text(
              "WatchWeb",
              style: TextStyle(
                color: Colors.yellow,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Icon(
              Icons.add,
              color: Colors.white,
              size: 30,
            ),
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
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
      ),
    );
  }
}
