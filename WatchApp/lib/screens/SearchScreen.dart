import 'package:WatchApp/models/MediaFilters.dart';
import 'package:WatchApp/screens/widgets/filterPopUpWidget.dart';
import 'package:WatchApp/screens/widgets/mediaWidget.dart';
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

  List<dynamic> finalList = [];

  @override
  Widget build(BuildContext context) {
    defaultMovies = Provider.of<MediaModel>(context, listen: true).moviesList;
    defaultSeries = Provider.of<MediaModel>(context, listen: true).seriesList;

    var searchMediaModel = Provider.of<SearchMediaModel>(context, listen: true);
    filteredMovies = Filters.filterMoviesByTitle(
        searchMediaModel.searchQuery, defaultMovies);
    filteredSeries = Filters.filterSeriesByTitle(
        searchMediaModel.searchQuery, defaultSeries);

    if (searchMediaModel.onlyMovies) {
      filteredMovies.isEmpty 
      ? (finalList = defaultMovies) 
      : (finalList = filteredMovies);
      }
    else {
      filteredSeries.isEmpty
      ? (finalList = defaultSeries)
      : (finalList = filteredSeries);
      }

    //double screenWidth = MediaQuery.of(context).size.width;
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
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Search movies and series...',
                    hintStyle: const TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.black,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    prefixIcon: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Icon(Icons.search, color: Colors.white),
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.more_vert, color: Colors.white),
                      onPressed: () {
                        showFiltersMenu(context);
                      },
                    ),
                  ),
                ),
              ),
              MediaItemReduced(media: finalList[0]),
              MediaItemReduced(media: finalList[1]),
              ListView.builder(
                itemCount: finalList.length,
                itemBuilder: (context, index) {
                  return MediaItemReduced(media: finalList[index]);
                }
              )
            ],
          ),
        ),
    );
  }
}
