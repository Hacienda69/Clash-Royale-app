import 'package:WatchApp/models/MediaFilters.dart';
import 'package:WatchApp/screens/widgets/sectionWidget.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:WatchApp/main.dart';
import 'package:WatchApp/screens/mainmenu.dart';
import 'package:WatchApp/models/APImovies.dart';
import 'package:WatchApp/models/APIseries.dart';

class SearchScreen extends StatefulWidget {
 const SearchScreen({
    super.key,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Movies> defaultMovies = [];
  List<Series> defaultSeries = [];

  List<Movies> filteredMovies = [];
  List<Series> filteredSeries = [];

  @override
  Widget build(BuildContext context) {
    defaultMovies = Provider.of<MediaModel>(context, listen: true).moviesList;
    defaultSeries = Provider.of<MediaModel>(context, listen: true).seriesList;

    var searchMediaModel = Provider.of<SearchMediaModel>(context, listen: true);
    filteredMovies = Filters.filterMoviesByTitle(searchMediaModel.searchQuery, defaultMovies);
    filteredSeries = Filters.filterSeriesByTitle(searchMediaModel.searchQuery, defaultSeries);

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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
               Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (query) {
                    searchMediaModel.setSearchQuery(query);
                  },
                  decoration: const InputDecoration(
                    hintText: 'Search movies and series...',
                  ),
                ),
              ),
              Section(
                title: "Movie Results",
                list: filteredMovies,
              ),
              Section(
                title: "Series Results",
                list: filteredSeries,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
