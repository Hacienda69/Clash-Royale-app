import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:WatchApp/main.dart';
import 'package:WatchApp/screens/mainmenu.dart';
import 'package:WatchApp/models/APImovies.dart';
import 'package:WatchApp/models/APIseries.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({
    super.key,
  });

  List<Movies> defaultMovies = [];
  List<Series> defaultSeries = [];

  List<Movies> filteredMovies = [];
  List<Series> filteredSeries = [];

  @override
  Widget build(BuildContext context) {
    defaultMovies = Provider.of<MediaModel>(context, listen: true).moviesList;
    defaultSeries = Provider.of<MediaModel>(context, listen: true).seriesList;

    Color backGroundColor = const Color.fromARGB(255, 17, 17, 17);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          shadowColor: Colors.black,
          elevation: 10,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const Text(
                "Search",
                style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.home_outlined,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        backgroundColor: backGroundColor,
      ),
    );
  }
}
