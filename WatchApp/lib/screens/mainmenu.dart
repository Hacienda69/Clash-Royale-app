import 'package:WatchApp/main.dart';
import 'package:WatchApp/screens/widgets/sectionWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:WatchApp/screens/widgets/mediaWidget.dart';
import 'package:WatchApp/screens/MyListScreen.dart';
import 'package:WatchApp/screens/SearchScreen.dart';
import 'package:WatchApp/models/MediaFilters.dart';
import 'package:WatchApp/models/APImovies.dart';
import 'package:WatchApp/models/APIseries.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    List<Series> series = Provider.of<MediaModel>(context, listen: true).seriesList;
    List<Movies> movies = Provider.of<MediaModel>(context, listen: true).moviesList;

    Color backGroundColor = const Color.fromARGB(255, 17, 17, 17);

    return Scaffold(
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
                Icons.search,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchScreen(),
                  ),
                );
              },
            ),
            const Text(
              "WatchWeb",
              style: TextStyle(
                color: Colors.yellow,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.add,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyListScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      backgroundColor: backGroundColor,
      body: 
          Provider.of<LoadingContent>(context, listen: false).isLoadingSeries 
          && Provider.of<LoadingContent>(context, listen: false).isLoadingSeries
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                //MOVIES
                const MediaTypeTitle(title: "Movies"),
                Section(title: "Top 100 Movies", list: movies),
                Section(
                  title: "Crime Movies",
                  list: Filters.filterMoviesByGenre("Crime", movies),
                ),
                Section(
                  title: "Action Movies",
                  list: Filters.filterMoviesByGenre("Action", movies),
                ),
                const MediaTypeTitle(title: "Series"),
                Section(title: "Top 100 Series", list: series),
                Section(
                  title: "Drama Series",
                  list: Filters.filterSeriesByGenre("Drama", series),
                ),
                Section(
                  title: "Comedy Series",
                  list: Filters.filterSeriesByGenre("Comedy", series),
                ),
              ],
            ),
    );
  }
}

class MediaTypeTitle extends StatelessWidget {
  final String title;

  const MediaTypeTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.fromLTRB(15, 8, 0, 0),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.yellow,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}